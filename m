Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED085EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 09:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7190A41812;
	Thu, 17 Aug 2023 09:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7190A41812
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TIXIGbZP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXJtwxdwgOUz; Thu, 17 Aug 2023 09:15:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 73FED4180A;
	Thu, 17 Aug 2023 09:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73FED4180A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53890C0071;
	Thu, 17 Aug 2023 09:15:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DD95C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B67661381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B67661381
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TIXIGbZP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJNMn_vcos5N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:15:47 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 602FD60EFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602FD60EFE
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bc63ef9959so62483505ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692263747; x=1692868547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kDdelgcBIspY6F/EUKlzdqvBROSrX1RLzAT7W5Jq5UM=;
 b=TIXIGbZPfAjdo6JM5jW25YTR0j7hyAKmCeKK9hB5bETehnsdJG579fwuE8YjAH1Q+j
 vo3AyXAFIXu1ZLtbeHSnmdPoCJF7tIaD2A+ubh5PNNc8sec5sdIRLkUH6ESW6lWvVs6D
 YYdHfNULjVGNRCkvPl92RvD3oNvvObDtuQ49dnq4p91cjcj/g7EgGhUFzoHI5BM25zKl
 oldknnF3iBNtpK/viriWeWgpSB5KH98RkO5KCMerXgsO0cvF4LNGdBYER7ZRN2UbYmTM
 UgvaXEHBlnixshbPJfd9yftfH2Osf24czY2EKjPWgNCDqmr2YN0Q1kDSiVLtfLttUM6x
 iklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692263747; x=1692868547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kDdelgcBIspY6F/EUKlzdqvBROSrX1RLzAT7W5Jq5UM=;
 b=I1wp9j67IGh9N9bl+gEkf9nQT2/UyXaQpd0xMBVoqysS2wZRhXkYlpEtHT01xQYNqb
 yGcmCz0wH2uXTmcW01JqYr84Jp93vCR1LZrqE3q8ybJtYEhUWHqVD2ZKSw9ejOdY1Zu9
 HP3Ya2+L9d6cqTP5o8pWMO5oc/5BtwQai/1g7+FDma/Gb3mGWQBANIe9Ef7MoLnZrOP9
 YTzOmJFN2bhy8LPnMw3QAYToXSD/giqjCRTfPDedDof/OlbX+WgaUa18x9QEY4qh1a4Y
 C4ZdT6KKuHiHoIQHnf/IafOR0O7wGrkTFxrXPnPQiCYh5ADbN7Kc7RqluXHin/0pgGpc
 Kkxg==
X-Gm-Message-State: AOJu0YwYF9o3krhz1OnsuTW/vuKUTj6E/G8IEMM/rcM8B4rLxD+V6PKz
 MaZHbA0P6DBvXCvVg49g2Jw=
X-Google-Smtp-Source: AGHT+IF8J9cddTtCDqAxUl5VVLq6EIkCrZpwO/rZwtzXEcKwqC3GePgGQrB+qyU+9ko3IfmjCku0eQ==
X-Received: by 2002:a17:902:f546:b0:1bb:97d0:c628 with SMTP id
 h6-20020a170902f54600b001bb97d0c628mr5146054plf.31.1692263746743; 
 Thu, 17 Aug 2023 02:15:46 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:1afa:cf81:3a3:6ec8])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a170902bd9700b001b03f208323sm14635208pls.64.2023.08.17.02.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 02:15:46 -0700 (PDT)
Date: Thu, 17 Aug 2023 14:45:40 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v5] selftests: rtc: Fixes rtctest error handling.
Message-ID: <20230817091540.GA72739@atom0118>
References: <20230717175251.54390-1-atulpant.linux@gmail.com>
 <202307172115223bd0669f@mail.local>
 <8d0c3075-22a0-bd13-45fe-f8c052e50588@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d0c3075-22a0-bd13-45fe-f8c052e50588@linuxfoundation.org>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Aug 16, 2023 at 09:59:30AM -0600, Shuah Khan wrote:
> On 7/17/23 15:15, Alexandre Belloni wrote:
> > On 17/07/2023 23:22:51+0530, Atul Kumar Pant wrote:
> > > Adds a check to verify if the rtc device file is valid or not
> > > and prints a useful error message if the file is not accessible.
> > > 
> > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > 
> > Please collect and keep the tags you got on previous versions
> > 
> > > ---
> > > 
> > > changes since v4:
> > >      Updated the commit message.
> > > 
> > > changes since v3:
> > >      Added Linux-kselftest and Linux-kernel mailing lists.
> > > 
> > > changes since v2:
> > >      Changed error message when rtc file does not exist.
> > > 
> > > changes since v1:
> > >      Removed check for uid=0
> > >      If rtc file is invalid, then exit the test.
> > > 
> > >   tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-
> > >   1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> > > index 63ce02d1d5cc..630fef735c7e 100644
> > > --- a/tools/testing/selftests/rtc/rtctest.c
> > > +++ b/tools/testing/selftests/rtc/rtctest.c
> > > @@ -17,6 +17,7 @@
> > >   #include <unistd.h>
> > >   #include "../kselftest_harness.h"
> > > +#include "../kselftest.h"
> > >   #define NUM_UIE 3
> > >   #define ALARM_DELTA 3
> > > @@ -419,6 +420,8 @@ __constructor_order_last(void)
> > >   int main(int argc, char **argv)
> > >   {
> > > +	int ret = -1;
> > > +
> > >   	switch (argc) {
> > >   	case 2:
> > >   		rtc_file = argv[1];
> > > @@ -430,5 +433,11 @@ int main(int argc, char **argv)
> > >   		return 1;
> > >   	}
> > > -	return test_harness_run(argc, argv);
> > > +	// Run the test if rtc_file is valid
> > > +	if (access(rtc_file, F_OK) == 0)
> > > +		ret = test_harness_run(argc, argv);
> > > +	else
> > > +		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
> 
> This should be skip not a fail. access() could for a number of reasons.
> Since the test isn't run when access() returns error, this would be a
> skip. Also the new message could be improved to use strerror() to
> print message with details on why access() failed.
> thanks,
> -- Shuah

	Thank for the feedback. I have made the changes based on above
	comments and updated the patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
