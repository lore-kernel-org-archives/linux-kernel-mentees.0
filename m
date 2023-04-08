Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120ABC77B61
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Apr 2023 11:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749EB40217;
	Sat,  8 Apr 2023 11:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 749EB40217
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=T9YlpSRf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPsqgO2q2SPY; Sat,  8 Apr 2023 11:50:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 753F040153;
	Sat,  8 Apr 2023 11:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753F040153
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4313CC0037;
	Sat,  8 Apr 2023 11:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D6E9C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 11:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E28EA60B8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 11:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E28EA60B8A
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T9YlpSRf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtJSugnCUg9y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 11:50:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64DC360ADA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64DC360ADA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Apr 2023 11:50:19 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4745E240004;
 Sat,  8 Apr 2023 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680954616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r6XcgiNEEbvnD2q3Z9jwmGFjFJOZ76ZmVy3qBCzyOvY=;
 b=T9YlpSRfAQiuaCi4hoYS7+lc7ddYr/oz2lKgSCHGLr5XZ8FL60rHexWXCnGW3dSb/cP0He
 2SWVy+t67U75wvoMBH03ySqsWH3RigJeOiGIz9Jf47uerIjZ/R6U84Zt5aPhYICXl7OkVC
 iU9gv8czLuwi6JeVq+pDLLqsB5yXdPjgwC5CNdIzKQ43RcGC8TsKRcf+EWjjW5josCPVG2
 6JsxrUgjNurFX4LWx0y0/hrRDmoWPk8yZodRL8Nyj1nmfH2vJ7bXZTdqFr6PjRgwPyW0+Z
 Te1jqH87d0ilCUnmdMVF30ODRn1jmKhsyau9XBGxzaDycii3nnAKfvp+KtslBg==
Date: Sat, 8 Apr 2023 13:50:15 +0200
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH] selftests: Improves rtctest error handling.
Message-ID: <20230408115015bcc4b5ba@mail.local>
References: <20230408074059.397065-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230408074059.397065-1-atulpant.linux@gmail.com>
Cc: a.zummo@towertech.it, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Alexandre Belloni via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 08/04/2023 13:10:59+0530, Atul Kumar Pant wrote:
> When running the rtctest without root privileges the test fails
> expectedly, but prints the logs that are not useful to point to the issue.
> Similarly, if we pass wrong rtc device file as an argument, the test
> output failure logs do not point to the issue that the rtc file is
> invalid.
> To handle these issues, this patch adds checks to verify uid with which
> the test is run and also if the rtc_file is valid.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  tools/testing/selftests/rtc/rtctest.c | 34 +++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 

Please run your patch through checkpatch.pl, the indentation and comment
style are not correct.

> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 2b9d929a24ed..9564346c63eb 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -388,16 +388,30 @@ __constructor_order_last(void)
>  
>  int main(int argc, char **argv)
>  {
> -	switch (argc) {
> -	case 2:
> -		rtc_file = argv[1];
> -		/* FALLTHROUGH */
> -	case 1:
> -		break;
> -	default:
> -		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> -		return 1;
> +    int ret = -1;
> +
> +    // Verify if the test is run as root
> +    if (getuid() != 0) {
> +		ksft_exit_skip("[ERROR]: Please run the test as root - Exiting.\n");

If this is an error, should we really return skip? This may end up being
silently ignored whereas the expectation is to test the rtc.

Also, you may use the rtc as non root so I guess the access() test
should be enough.

> +    }
> +
> +    switch (argc) {
> +    case 2:
> +        rtc_file = argv[1];
> +        /* FALLTHROUGH */
> +    case 1:
> +        break;
> +    default:
> +        fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> +        return 1;
>  	}
>  
> -	return test_harness_run(argc, argv);
> +    // Run the test if rtc_file is valid
> +    if (access(rtc_file, F_OK) == 0) {
> +	    ret = test_harness_run(argc, argv);
> +    } else {
> +		ksft_exit_skip("[ERROR]: %s : File does not exists - Exiting\n", rtc_file);


> +    }
> +
> +    return ret;
>  }
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
