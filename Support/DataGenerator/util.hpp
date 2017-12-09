#pragma once
#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

#include <fmt/format.h>
#include <fmt/ostream.h>

namespace util
{
    template <typename T, typename F>
    auto find_if(T&& coll, F&& func)
    {
        return std::find_if(std::begin(coll), std::end(coll), func);
    }

    template <typename T, typename F>
    auto count_if(T&& coll, F&& func)
    {
        return std::count_if(std::begin(coll), std::end(coll), func);
    }

    std::string filename(const std::string& path);

    std::string camel_to_underscores(const std::string& input);

    std::string make_slug(const std::string& name);

    template <typename C, typename F>
    std::string comma_separated(const C& collection, F&& f)
    {
        std::string out;
        for(const auto& e : collection)
            out += fmt::format("{0}, ", f(e));
        if(out.length())
            out.resize(out.size() - 2);
        return out;
    }

    template <typename C>
    std::string comma_separated(const C& collection)
    {
        std::string out;
        for(const auto& e : collection)
            out += fmt::format("{0}, ", e);
        if(out.length())
            out.resize(out.size() - 2);
        return out;
    }

    template <typename C, typename T, typename F>
    size_t member_max_slug_len(const C& collection, const F(T::*member))
    {
        int maxLen = 0;
        for(const auto& c : collection)
        {
            auto l = make_slug(c.*member).length();
            if(maxLen < l)
                maxLen = l;
        }
        return maxLen;
    }

    template <typename CharType, typename CharTraitsType>
    std::basic_string<CharType, CharTraitsType>& ltrim(std::basic_string<CharType, CharTraitsType>& s)
    {
        s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](CharType c) { return !std::isspace(c); }));
        return s;
    }

    template <typename CharType, typename CharTraitsType>
    std::basic_string<CharType, CharTraitsType>& rtrim(std::basic_string<CharType, CharTraitsType>& s)
    {
        s.erase(std::find_if(s.rbegin(), s.rend(), [](CharType c) { return !std::isspace(c); }).base(), s.end());
        return s;
    }

    template <typename CharType, typename CharTraitsType>
    std::basic_string<CharType, CharTraitsType>& trim(std::basic_string<CharType, CharTraitsType>& s)
    {
        return ltrim(rtrim(s));
    }

    size_t classID_from_classMask(size_t mask);
    size_t classMask_from_classID(size_t classID);

    class exception : public std::runtime_error
    {
    public:
        exception() : std::runtime_error("util::exception") {}

        virtual const char* what() const noexcept override { return err.c_str(); }

        template <typename T>
        friend exception& operator<<(exception& ex, const T& t);
        template <typename T>
        friend exception&& operator<<(exception&& ex, const T& t);

    private:
        std::string err;
    };

    template <typename T>
    inline util::exception& operator<<(util::exception& ex, const T& t)
    {
        std::ostringstream oss;
        oss << t;
        ex.err += oss.str();
        return ex;
    }

    template <typename T>
    inline util::exception&& operator<<(util::exception&& ex, const T& t)
    {
        std::ostringstream oss;
        oss << t;
        ex.err += oss.str();
        return std::move(ex);
    }
} // namespace util

#define UTIL_STRINGIZE_DETAIL(x) #x
#define UTIL_STRINGIZE(x) UTIL_STRINGIZE_DETAIL(x)
#define THROW_UTIL_EXCEPTION throw util::exception{} << util::filename(__FILE__) << ":" << UTIL_STRINGIZE(__LINE__) << " - "
