Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628D9EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Jul 2023 13:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E03E940463;
	Mon, 17 Jul 2023 13:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E03E940463
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PNkPUvNE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdJ7ldqjEd2V; Mon, 17 Jul 2023 13:50:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96A2740181;
	Mon, 17 Jul 2023 13:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A2740181
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 819D0C0072;
	Mon, 17 Jul 2023 13:50:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58FEBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 13:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2705D60EF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 13:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2705D60EF6
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PNkPUvNE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nxGP557d0fl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 13:50:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D16F60EA6
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D16F60EA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 13:50:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A14DDCD490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 13:40:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 426E5E0003;
 Mon, 17 Jul 2023 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689601215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cIOJ9XDDj8Zlm/dBf+2lrlsSRq6U8W8Z1yTJUmZo32g=;
 b=PNkPUvNEtYWWK32WmffVTKZFtUbBTJN3EdTEct3h83Ud7UzarKkyL1fG4IOh6koK4wywAn
 v3A9DRzr4NrWT2pnff+FUBEuz1OGpBAVVNhpSbcTkqAZ53cYcyUhx5LFjQobTaDORhcHSg
 9G9MbLzndqOOxjwvJuWt6ETQboDZm6yZUrhJs3mdVRG+NgNyB6kH6IHVVwpj2c//vem/As
 jAaNudTcFF4wq1b8ACbb2czoE0sjbQsTFcVuXw9fEZj3AyR6ZO6yuNQn7waz6snGiuJ21G
 X7tKU6tDeitGtlkKira46KELxX5JdCqZsc/0jAgx6kmomhqwUWydvXo9GTQ91g==
Date: Mon, 17 Jul 2023 15:40:15 +0200
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v4] selftests: rtc: Improves rtctest error handling.
Message-ID: <2023071713401551822659@mail.local>
References: <20230716181825.44337-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716181825.44337-1-atulpant.linux@gmail.com>
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

On 16/07/2023 23:48:25+0530, Atul Kumar Pant wrote:
> When running the rtctest if we pass wrong rtc device file as an argument
> the test fails expectedly, but prints the logs that are not useful
> to point out the issue.
> To handle this, the patch adds a checks to verify if the rtc_file is valid.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
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
