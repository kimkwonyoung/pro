(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Sidebar Toggler
    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });


    // Progress Bar
    $('.pg-bar').waypoint(function () {
        $('.progress .progress-bar').each(function () {
            $(this).css("width", $(this).attr("aria-valuenow") + '%');
        });
    }, {offset: '80%'});


    // Calender
    $('#calender').datetimepicker({
        inline: true,
        format: 'L'
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        items: 1,
        dots: true,
        loop: true,
        nav : false
    });

    // Single Bar Chart
// 월별 봉사 수 차트 데이터 가져오기
fetch('/admin/ChartRecruitBoardCount')
    .then(response => response.json())
    .then(data => {
        var ctx4 = $("#bar-chart").get(0).getContext("2d");
        var myChart4 = new Chart(ctx4, {
            type: "bar",
            data: {
                labels: data.selectMonthRecruitCount.map(item => item.month), // 월별 레이블
                datasets: [{
					label: "월 단위 봉사 집계",
                    backgroundColor: "rgba(0, 156, 255, .7)",
                    data: data.selectMonthRecruitCount.map(item => item.totalRecruits) // 월별 봉사 수 데이터
                }]
            },
            options: {
                responsive: true
            }
        });
    });


    // Doughnut Chart
fetch('/admin/ChartCategoryCount') 
    .then(response => response.json())
    .then(data => {
        // 필터링 조건에 따라 데이터 필터링
        const filteredData = data.selectCategoryCount.filter(item => item.codeGroup === '0001');

        var ctx = document.getElementById("doughnut-chart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "doughnut",
            data: {
                labels: filteredData.map(item => item.codeName), // 필터링된 데이터의 레이블
                datasets: [{
                   backgroundColor: filteredData.map((item, index) => {
                        // 여기서 각 데이터 포인트에 대한 색상을 설정합니다.
                        const colors = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'];
                        return colors[index % colors.length]; // 색상 배열을 순환하며 적용
                    }),
                    data: filteredData.map(item => item.categoryCount) // 필터링된 데이터의 값
                }]
            },
            options: {
                responsive: true
            }
        });
    });


    
})(jQuery);

