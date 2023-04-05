Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E04AC761AF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Apr 2023 19:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD494192F;
	Wed,  5 Apr 2023 19:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBD494192F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=DJqRYyvr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYw27VyQ-tLe; Wed,  5 Apr 2023 19:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9301240135;
	Wed,  5 Apr 2023 19:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9301240135
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6998FC0036;
	Wed,  5 Apr 2023 19:03:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EBDBC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 19:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 424A6408EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 19:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 424A6408EF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=DJqRYyvr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBztEWxvnJpp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 19:03:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3986040132
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3986040132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Apr 2023 19:03:33 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-324419ed7d9so156245ab.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Apr 2023 12:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1680721412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4TVi1lyJMmYcYaP9PAZ762NsVh9YbaxOBrDxQLPvKzw=;
 b=DJqRYyvrDqGNM8BA/RjvPC+5g6rJMIho1xJqOjAqClM+Pvbqicldec1Urlh+Ny1j6v
 GUDgHy7enhtHiy+x02OSEMJa9/+EEueHNNPkwsbq+mrwBdsdGc9NlwNSP3q8R0fpI9+X
 N0VFkMExIbxVmgHd01B7NJFp5G3Ph+RKBqQ2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680721412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4TVi1lyJMmYcYaP9PAZ762NsVh9YbaxOBrDxQLPvKzw=;
 b=tV/bB8xMhZUI9NMMeT2EEHbrei+zoOdlGIn6OSe6bpOPC8Kz1pwkGmQxkoJRWexRQF
 Ji07WxRbRFY4paHVt4w2l46ZTFAxSPpgaDRhtuaiBOVM1f/r6jQd53TR0qFGXoCu0U48
 y2g3aa7HMnasGV17TpP/OmmXlT1o5jxhdtC8959BlAg+TsokWajDJLYYirxdbm4tYjQR
 ageCQ/jDiWyScOHMMaPwtUs9QhWsq49bouNfoLl6UyfShRcyQca/PRv+3hc1ELVhchKD
 LD26U0KcfyxLHbQziyU0YJICjInkTQYmtc10lxXlG4kMCeT69UpMXdVTg6TacB28jeW+
 DzFw==
X-Gm-Message-State: AAQBX9eYI0IwofH9vuOYvO2UQSaPlXslQt8FGPSA8iJa826rpfnGvra3
 jGpT27buF9pKq3lRaiBmU5uQOWII
X-Google-Smtp-Source: AKy350bGyW3saNrk3z4H+2SnOMjOBKRW77KKmO2Uq+eRtkg8yKQT0zqEraoujyGm/ZRmY9HClVVqpg==
X-Received: by 2002:a05:6e02:2218:b0:327:fb76:84e5 with SMTP id
 j24-20020a056e02221800b00327fb7684e5mr749178ilf.0.1680721412110; 
 Wed, 05 Apr 2023 12:03:32 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 b1-20020a92a041000000b00326bd11f5d1sm971992ilm.11.2023.04.05.12.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:03:31 -0700 (PDT)
Message-ID: <8038b636-7275-4f44-0b1f-df4190b94a40@linuxfoundation.org>
Date: Wed, 5 Apr 2023 13:03:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] selftests: media_tests: Add new subtest to
 video_device_test
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>
References: <20230401092207.16667-1-ivan.orlov0322@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230401092207.16667-1-ivan.orlov0322@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 4/1/23 03:22, Ivan Orlov wrote:
> Add new subtest to video_device_test to cover the VIDIOC_G_PRIORITY
> and VIDIOC_S_PRIORITY ioctl calls. This test tries to set the priority
> associated with the file descriptior via ioctl VIDIOC_S_PRIORITY
> command from V4L2 API. After that, the test tries to get the new
> priority via VIDIOC_G_PRIORITY ioctl command and compares the result
> with the v4l2_priority it set before. At the end, the test restores the
> old priority.
> 
> This test will increase the code coverage for video_device_test, so
> I think it might be useful. Additionally, this patch will refactor the
> video_device_test a little bit, according to the new functionality.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>   .../selftests/media_tests/video_device_test.c | 131 +++++++++++++-----
>   1 file changed, 93 insertions(+), 38 deletions(-)
> 
> diff --git a/tools/testing/selftests/media_tests/video_device_test.c b/tools/testing/selftests/media_tests/video_device_test.c
> index 0f6aef2e2593..5e6f65ad2ca3 100644
> --- a/tools/testing/selftests/media_tests/video_device_test.c
> +++ b/tools/testing/selftests/media_tests/video_device_test.c
> @@ -13,18 +13,9 @@
>    * in the Kselftest run. This test should be run when hardware and driver
>    * that makes use of V4L2 API is present.
>    *
> - * This test opens user specified Video Device and calls video ioctls in a
> - * loop once every 10 seconds.
> - *
>    * Usage:
>    *	sudo ./video_device_test -d /dev/videoX
> - *
> - *	While test is running, remove the device or unbind the driver and
> - *	ensure there are no use after free errors and other Oops in the
> - *	dmesg.
> - *	When possible, enable KaSan kernel config option for use-after-free
> - *	error detection.
> -*/
> + */

Leave this text here so it is easy to spot. There is no need to move this
down.

>   
>   #include <stdio.h>
>   #include <unistd.h>
> @@ -37,45 +28,67 @@
>   #include <time.h>
>   #include <linux/videodev2.h>
>   
> -int main(int argc, char **argv)
> +#define PRIORITY_MAX 4
> +
> +int priority_test(int fd)
>   {
> -	int opt;
> -	char video_dev[256];
> -	int count;
> -	struct v4l2_tuner vtuner;
> -	struct v4l2_capability vcap;
> +	/* This test will try to update the priority associated with a file descriptor */
> +
> +	enum v4l2_priority old_priority, new_priority, priority_to_compare;
>   	int ret;
> -	int fd;
> +	int result = 0;
>   
> -	if (argc < 2) {
> -		printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
> -		exit(-1);
> +	ret = ioctl(fd, VIDIOC_G_PRIORITY, &old_priority);
> +	if (ret < 0) {
> +		printf("Failed to get priority: %s\n", strerror(errno));
> +		return -1;
> +	}
> +	new_priority = (old_priority + 1) % PRIORITY_MAX;
> +	ret = ioctl(fd, VIDIOC_S_PRIORITY, &new_priority);
> +	if (ret < 0) {
> +		printf("Failed to set priority: %s\n", strerror(errno));
> +		return -1;
> +	}
> +	ret = ioctl(fd, VIDIOC_G_PRIORITY, &priority_to_compare);
> +	if (ret < 0) {
> +		printf("Failed to get new priority: %s\n", strerror(errno));
> +		result = -1;
> +		goto cleanup;
> +	}
> +	if (priority_to_compare != new_priority) {
> +		printf("Priority wasn't set - test failed\n");
> +		result = -1;
>   	}
>   
> -	/* Process arguments */
> -	while ((opt = getopt(argc, argv, "d:")) != -1) {
> -		switch (opt) {
> -		case 'd':
> -			strncpy(video_dev, optarg, sizeof(video_dev) - 1);
> -			video_dev[sizeof(video_dev)-1] = '\0';
> -			break;
> -		default:
> -			printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
> -			exit(-1);
> -		}
> +cleanup:
> +	ret = ioctl(fd, VIDIOC_S_PRIORITY, &old_priority);
> +	if (ret < 0) {
> +		printf("Failed to restore priority: %s\n", strerror(errno));
> +		return -1;
>   	}
> +	return result;
> +}
> +
> +int loop_test(int fd)
> +{
> +	/*
> +	 * This test opens user specified Video Device and calls video ioctls in a
> +	 * loop once every 10 seconds.
> +	 * While test is running, remove the device or unbind the driver and
> +	 * ensure there are no use after free errors and other Oops in the
> +	 * dmesg.
> +	 * When possible, enable KaSan kernel config option for use-after-free
> +	 * error detection.
> +	 */
> +	int count;
> +	struct v4l2_tuner vtuner;
> +	struct v4l2_capability vcap;
> +	int ret;
>   
>   	/* Generate random number of interations */
>   	srand((unsigned int) time(NULL));
>   	count = rand();
>   
> -	/* Open Video device and keep it open */
> -	fd = open(video_dev, O_RDWR);
> -	if (fd == -1) {
> -		printf("Video Device open errno %s\n", strerror(errno));
> -		exit(-1);
> -	}
> -
>   	printf("\nNote:\n"
>   	       "While test is running, remove the device or unbind\n"
>   	       "driver and ensure there are no use after free errors\n"
> @@ -98,4 +111,46 @@ int main(int argc, char **argv)
>   		sleep(10);
>   		count--;
>   	}
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int opt;
> +	char video_dev[256];
> +	int fd;
> +	int test_result;
> +
> +	if (argc < 2) {
> +		printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
> +		exit(-1);
> +	}
> +
> +	/* Process arguments */
> +	while ((opt = getopt(argc, argv, "d:")) != -1) {
> +		switch (opt) {
> +		case 'd':
> +			strncpy(video_dev, optarg, sizeof(video_dev) - 1);
> +			video_dev[sizeof(video_dev)-1] = '\0';
> +			break;
> +		default:
> +			printf("Usage: %s [-d </dev/videoX>]\n", argv[0]);
> +			exit(-1);
> +		}
> +	}
> +
> +	/* Open Video device and keep it open */
> +	fd = open(video_dev, O_RDWR);
> +	if (fd == -1) {
> +		printf("Video Device open errno %s\n", strerror(errno));
> +		exit(-1);
> +	}
> +
> +	test_result = priority_test(fd);
> +	if (!test_result)
> +		printf("Priority test - PASSED\n");
> +	else
> +		printf("Priority test - FAILED\n");
> +
> +	loop_test(fd);
>   }

Otherwise looks good to me.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
