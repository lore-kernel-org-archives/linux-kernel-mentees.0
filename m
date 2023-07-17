Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B17C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Jul 2023 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0100A40A73;
	Mon, 17 Jul 2023 21:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0100A40A73
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=WfFAT6Pb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdtFNS1RZLcT; Mon, 17 Jul 2023 21:15:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B91BF4015A;
	Mon, 17 Jul 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91BF4015A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91206C0072;
	Mon, 17 Jul 2023 21:15:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23B0CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0260860F33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0260860F33
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WfFAT6Pb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEOb6t8zt3mK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 21:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D70886068B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D70886068B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 21:15:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDD0B1BF207;
 Mon, 17 Jul 2023 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689628523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e3xD3OEdrYlaL+qPG6Bi+cSbmCBZ9vMuc95bgvy+HZI=;
 b=WfFAT6PbJmDrUoOEyEH3fruRNy5nAe0fHBucJBtMcJDoDaHhs1bGyhhwhht41o5FEixahv
 U+HR7la6PNs19yMM6Dw9XJpZQKhVnvlA/QK1YgbZbG7yZM8/fYoua1NDSmEjf1hIrhbTdR
 pen4Bj2apaouo3tfs56uK+1INzeEy92gH8ZFwYDIPDHb4Z+GxUVTVMH8dfeAPnhyB/daw6
 37gIqZchqK2oCDU9POaIMducRPI1n7pTIzLCABF+2GlWdeZGGMlSVAiDEE3zPu6Ci89p2Z
 LUkg12cvNG4Elgc3UfgFR0Wbl45c1i0IncpQuMHyOKmcH/qQXCaOf0lf5TgSkQ==
Date: Mon, 17 Jul 2023 23:15:22 +0200
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v5] selftests: rtc: Fixes rtctest error handling.
Message-ID: <202307172115223bd0669f@mail.local>
References: <20230717175251.54390-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717175251.54390-1-atulpant.linux@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org
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

On 17/07/2023 23:22:51+0530, Atul Kumar Pant wrote:
> Adds a check to verify if the rtc device file is valid or not
> and prints a useful error message if the file is not accessible.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>

Please collect and keep the tags you got on previous versions

> ---
> 
> changes since v4:
>     Updated the commit message.
> 
> changes since v3:
>     Added Linux-kselftest and Linux-kernel mailing lists.
> 
> changes since v2:
>     Changed error message when rtc file does not exist.
> 
> changes since v1:
>     Removed check for uid=0
>     If rtc file is invalid, then exit the test.
> 
>  tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 63ce02d1d5cc..630fef735c7e 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -17,6 +17,7 @@
>  #include <unistd.h>
>  
>  #include "../kselftest_harness.h"
> +#include "../kselftest.h"
>  
>  #define NUM_UIE 3
>  #define ALARM_DELTA 3
> @@ -419,6 +420,8 @@ __constructor_order_last(void)
>  
>  int main(int argc, char **argv)
>  {
> +	int ret = -1;
> +
>  	switch (argc) {
>  	case 2:
>  		rtc_file = argv[1];
> @@ -430,5 +433,11 @@ int main(int argc, char **argv)
>  		return 1;
>  	}
>  
> -	return test_harness_run(argc, argv);
> +	// Run the test if rtc_file is valid
> +	if (access(rtc_file, F_OK) == 0)
> +		ret = test_harness_run(argc, argv);
> +	else
> +		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
> +
> +	return ret;
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
