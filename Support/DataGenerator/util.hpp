#pragma once
#include <algorithm>
#include <cstdlib>
#include <sstream>
#include <string>
#include <vector>

namespace util
{
    template <typename T, typename F>
    auto find_if(T&& coll, F&& func)
    {
        return std::find_if(std::begin(coll), std::end(coll), func);
    }

    std::string filename(const std::string& path);

    std::string make_slug(const std::string& name);

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
