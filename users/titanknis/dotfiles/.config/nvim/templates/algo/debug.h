// debug.h
#ifndef DEBUG_H
#define DEBUG_H

// #include <bits/stdc++.h>
#include <bitset>
#include <deque>
#include <iostream>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <tuple>
#include <unordered_map>
#include <unordered_set>
#include <vector>

using namespace std;

// >> operator overload for major datastructures
// Forward declarations
// Forward declarations - original ones
template <typename T>
std::ostream& operator<<(std::ostream&, const std::vector<T>&);
template <typename T, size_t N>
std::ostream& operator<<(std::ostream&, const std::array<T, N>&);
template <typename T, typename U>
std::ostream& operator<<(std::ostream&, const std::pair<T, U>&);
template <typename K, typename V>
std::ostream& operator<<(std::ostream&, const std::map<K, V>&);
template <typename K, typename V>
std::ostream& operator<<(std::ostream&, const std::unordered_map<K, V>&);
template <typename T>
std::ostream& operator<<(std::ostream&, const std::set<T>&);
template <typename T>
std::ostream& operator<<(std::ostream&, const std::unordered_set<T>&);
template <class... Args>
std::ostream& operator<<(std::ostream&, const std::tuple<Args...>&);

// Missing forward declarations that should be added
template <typename K, typename V>
std::ostream& operator<<(std::ostream&, const std::multimap<K, V>&);
template <typename K, typename V>
std::ostream& operator<<(std::ostream&, const std::unordered_multimap<K, V>&);
template <typename T>
std::ostream& operator<<(std::ostream&, const std::multiset<T>&);
template <typename T>
std::ostream& operator<<(std::ostream&, const std::unordered_multiset<T>&);
template <size_t N>
std::ostream& operator<<(std::ostream&, const std::bitset<N>&);
template <typename T>
std::ostream& operator<<(std::ostream&, const std::deque<T>&);
template <typename T, typename Container, typename Compare>
std::ostream& operator<<(std::ostream&, std::priority_queue<T, Container, Compare>);
template <typename T>
std::ostream& operator<<(std::ostream&, std::stack<T>);
template <typename T>
std::ostream& operator<<(std::ostream&, std::queue<T>);

template <typename T>
std::ostream& operator<<(std::ostream& os, const std::vector<T>& vec)
{
    os << "[ ";
    for (auto& x : vec)
        os << x << ' ';
    os << "]";
    return os;
}
// Array
template <typename T, size_t N>
std::ostream& operator<<(std::ostream& os, const std::array<T, N>& arr)
{
    os << "[ ";
    for (const auto& x : arr)
        os << x << " ";
    os << "]";
    return os;
}
// Pair
template <typename T, typename U>
std::ostream& operator<<(std::ostream& os, const std::pair<T, U>& p)
{
    os << "(" << p.first << ", " << p.second << ")";
    return os;
}
// Map
template <typename K, typename V>
std::ostream& operator<<(std::ostream& os, const std::map<K, V>& m)
{
    os << "{ ";
    for (const auto& [key, value] : m)
        os << key << ":" << value << " ";
    os << "}";
    return os;
}
// Unordered Map
template <typename K, typename V>
std::ostream& operator<<(std::ostream& os, const std::unordered_map<K, V>& m)
{
    os << "{ ";
    for (const auto& [key, value] : m)
        os << key << ":" << value << " ";
    os << "}";
    return os;
}

// Multimap
template <typename K, typename V>
std::ostream& operator<<(std::ostream& os, const std::multimap<K, V>& m)
{
    os << "{ ";
    for (const auto& [key, value] : m)
        os << key << ":" << value << " ";
    os << "}";
    return os;
}

// Unordered Multimap
template <typename K, typename V>
std::ostream& operator<<(std::ostream& os, const std::unordered_multimap<K, V>& m)
{
    os << "{ ";
    for (const auto& [key, value] : m)
        os << key << ":" << value << " ";
    os << "}";
    return os;
}

// Set
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::set<T>& s)
{
    os << "{ ";
    for (const auto& x : s)
        os << x << " ";
    os << "}";
    return os;
}

// Unordered Set
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::unordered_set<T>& s)
{
    os << "{ ";
    for (const auto& x : s)
        os << x << " ";
    os << "}";
    return os;
}

// Multiset
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::multiset<T>& s)
{
    os << "{ ";
    for (const auto& x : s)
        os << x << " ";
    os << "}";
    return os;
}

// Unordered Multiset
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::unordered_multiset<T>& s)
{
    os << "{ ";
    for (const auto& x : s)
        os << x << " ";
    os << "}";
    return os;
}

// Bitset
template <size_t N>
std::ostream& operator<<(std::ostream& os, const std::bitset<N>& b)
{
    os << b.to_string(); // Uses the `to_string()` method to print the bitset
    return os;
}

// Tuple
template <class... Args>
std::ostream& operator<<(std::ostream& os, const std::tuple<Args...>& t)
{
    os << "(";
    if constexpr (sizeof...(Args) > 0)
        std::apply(
            [&os](const auto& first, const auto&... rest)
            {
                os << first;
                ((os << ", " << rest), ...);
            },
            t);
    os << ")";
    return os;
}

// Deque
template <typename T>
std::ostream& operator<<(std::ostream& os, const std::deque<T>& dq)
{
    os << "[ ";
    for (const auto& x : dq)
        os << x << " ";
    os << "]";
    return os;
}

// Priority_queue
template <typename T, typename Container, typename Compare>
std::ostream& operator<<(std::ostream& os, std::priority_queue<T, Container, Compare> pq)
{
    os << "[ ";
    while (!pq.empty())
    {
        os << pq.top() << " ";
        pq.pop();
    }
    os << "]";
    return os;
}

// Stack
template <typename T>
std::ostream& operator<<(std::ostream& os, std::stack<T> s)
{
    os << "[ ";
    while (!s.empty())
    {
        os << s.top() << " ";
        s.pop();
    }
    os << "]";
    return os;
}

// Queue
template <typename T>
std::ostream& operator<<(std::ostream& os, std::queue<T> q)
{
    os << "[ ";
    while (!q.empty())
    {
        os << q.front() << " ";
        q.pop();
    }
    os << "]";
    return os;
}

// advanced version that support multiple variables printing

#define debug(...)                         \
    (                                      \
        [](auto&&... args)                 \
        {                                  \
            cerr << #__VA_ARGS__ << " = "; \
            ((cerr << args << " "), ...);  \
            cerr << endl;                  \
        }(__VA_ARGS__))

#define debugln(...) cerr << __LINE__ << ": ", debug(__VA_ARGS__)

// simple version that support only printing one variable with debug(x)
// #define debug(x) cerr << #x << " = ", cerr << x << endl;
// #define debugln(x) cerr << __LINE__ << ": ", debug(x)

#endif // DEBUG_H
