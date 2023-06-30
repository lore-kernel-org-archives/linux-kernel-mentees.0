Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78641EB64D7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jun 2023 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E981260F4A;
	Fri, 30 Jun 2023 14:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E981260F4A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cferrIn0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUN2BqCARw2E; Fri, 30 Jun 2023 14:18:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B3D9F60B01;
	Fri, 30 Jun 2023 14:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D9F60B01
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A8BAC0072;
	Fri, 30 Jun 2023 14:18:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C2C8C0037
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jun 2023 14:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1043402FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jun 2023 14:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1043402FD
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cferrIn0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyu4tlMYsUOj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jun 2023 14:17:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A20400CB
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93A20400CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jun 2023 14:17:59 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7891DC700B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jun 2023 14:08:49 +0000 (UTC)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1688134124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gaChAYQvcQencxIx9Y/lMaYLXshEbiUIrJCu0CXZkls=;
 b=cferrIn0nBl11Wl+tNeqRb+AjrfYryXgXHTXqkgR4M2EbK+ZIghnVIALIgz4qtAsrOyoeA
 JiEhzGQVXnSGRFt6qUzx+65hufO6+oRbIiLVBAX/yLq87pO1VZiA9mp0GmMtYaW56locN7
 nf7BZU2XOaP1gC9iRqIKJGy/Evuy8P6RC1vV77O6h8Xf5XeuuT7CHpKTVdZGchSsCGbCVM
 BrX9ZHfucn2749jTNYKIIKzjBl7b7j+z99OAH3hjdegalJrT9hH8FlLC0tnjCUyGEP8EBL
 1dmz20VZ5gzXV0/KDUilN2e5te4wgZwRZMMv7likhmYwqOGNKg7j+bUfAdqbBQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE39C40004;
 Fri, 30 Jun 2023 14:08:43 +0000 (UTC)
Date: Fri, 30 Jun 2023 16:08:43 +0200
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v3] selftests: rtc: Improves rtctest error handling.
Message-ID: <20230630140843d6a4b3c2@mail.local>
References: <20230625164748.22458-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230625164748.22458-1-atulpant.linux@gmail.com>
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

On 25/06/2023 22:17:48+0530, Atul Kumar Pant wrote:
> When running the rtctest if we pass wrong rtc device file as an argument
> the test fails expectedly, but prints the logs that are not useful
> to point out the issue.
> To handle this, the patch adds a checks to verify if the rtc_file is valid.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
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
