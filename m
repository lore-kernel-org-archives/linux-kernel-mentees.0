Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0C9CE7A88
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Sep 2023 17:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4697B61086;
	Sat, 23 Sep 2023 17:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4697B61086
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tbgdk4as
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBLfdN7t5kCX; Sat, 23 Sep 2023 17:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0210761085;
	Sat, 23 Sep 2023 17:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0210761085
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6B42C0039;
	Sat, 23 Sep 2023 17:37:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96D90C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7098D41903
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7098D41903
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tbgdk4as
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9jm3YfKaWjH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:36:58 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97968418A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 17:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97968418A7
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bf5c314a57so29757985ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Sep 2023 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695490618; x=1696095418;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jlE6JLRfL48qtVwq8jA/2h0BZ48NcfrSjI1lDQ5avkE=;
 b=Tbgdk4asDtKFVvCvguhZ9YoKGlUdn7DQuzOAtWaB+w+oswKWzXFFVSzQpf0LEJONSk
 pMzBH8jmt/6oX54j2P+cstCGdDRzdlW6P9tbWLxo/QpS/gYUNTICUA2V2BEVmzbOpet+
 13HpfV8stQRtnPpRxVHYNE8eKwvaDeax794bfpWSIQIIEPZ4uinV3T8yjiyDTaeB9B3H
 1dvVyK+0WYyR2kp6v4sZEesrQGyODlv/XtNLTyB11F8w/6DPrReGt0YU0GTzFcFJbcu2
 HIfY4FqmP2EwKEizTgL/pitA+uLhLzx9JBepzw+qmOxFvekqWhdEzv9EAokxWQXN3pUG
 aijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695490618; x=1696095418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlE6JLRfL48qtVwq8jA/2h0BZ48NcfrSjI1lDQ5avkE=;
 b=he3ghf0hXNga9e6ZAGFRqRYfiVVXcLPWB/4im3/ahIMeWPXI5l7JHVBQ1KnOABwL3p
 y2I0/cOpQqOVsR/aMTKBXspbhQAgMtO5G//Iugu2mTAZMbgBbKB2JlHLGaGnz7zXoIZw
 bj4yT4QS9/bvXMevn/GfMirG0p93TKgUaneg15yUeY1sdQG82tJRAXI33TGGMpQrx4p8
 wIpknN/eR27gj5oVM5umtxgyeUCb/3/aj8hkLod5HaG67PWytAH308DEgCrOhY2RHjj/
 CiRC3kkJGsYBcw0UUZrwDdblnRR9dX0U+ufwoWncw9cB6Y7j7VSD+ybnstzFsb3uko1h
 eidQ==
X-Gm-Message-State: AOJu0YxwI5R4Bxg3ei0ZRALbR21fslFIDitbQbCMXCJIXGUso2D/k9Wl
 Zkz/BAKMlIxj97a1pSxy6u4=
X-Google-Smtp-Source: AGHT+IFSlAyqGeRovEjDNA4A/S+3zh83GX0PrVo3gnROIu0Q0EjRgGRrlmfg0p7A9iVAdg6YXQtFCQ==
X-Received: by 2002:a17:902:e84d:b0:1c4:50fd:7cd1 with SMTP id
 t13-20020a170902e84d00b001c450fd7cd1mr2130303plg.11.1695490617930; 
 Sat, 23 Sep 2023 10:36:57 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:3075:4405:fdad:b3f9])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902e54500b001b8b2b95068sm5585448plf.204.2023.09.23.10.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 10:36:57 -0700 (PDT)
Date: Sat, 23 Sep 2023 23:06:52 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Message-ID: <20230923173652.GC159038@atom0118>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817091401.72674-1-atulpant.linux@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
> Adds a check to verify if the rtc device file is valid or not
> and prints a useful error message if the file is not accessible.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
> 
> changes since v5:
>     Updated error message to use strerror().
> 	If the rtc file is invalid, the skip the test.
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
>  tools/testing/selftests/rtc/rtctest.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index 630fef735c7e..27b466111885 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -15,6 +15,7 @@
>  #include <sys/types.h>
>  #include <time.h>
>  #include <unistd.h>
> +#include <error.h>
>  
>  #include "../kselftest_harness.h"
>  #include "../kselftest.h"
> @@ -437,7 +438,7 @@ int main(int argc, char **argv)
>  	if (access(rtc_file, F_OK) == 0)
>  		ret = test_harness_run(argc, argv);
>  	else
> -		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
> +		ksft_exit_skip("%s: %s\n", rtc_file, strerror(errno));
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 

	Hi Shuah, I have made the changes as per your comments. Can you please
	review the changes ?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
