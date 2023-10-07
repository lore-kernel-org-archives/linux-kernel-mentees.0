Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5719E95A66
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 15:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4497640529;
	Sat,  7 Oct 2023 15:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4497640529
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=APqA2aDG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcU7BsWmhwUY; Sat,  7 Oct 2023 15:43:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DD4B2400CE;
	Sat,  7 Oct 2023 15:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4B2400CE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5877C0039;
	Sat,  7 Oct 2023 15:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F186BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAF1C41DA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF1C41DA9
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=APqA2aDG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGIXU0eRF4Sa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:43:25 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3F8541DA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 15:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F8541DA7
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso26902705ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696693405; x=1697298205;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t/XmnQ8BulCB8LjvQmFruCYlEAR5yQvD41aixSO30z8=;
 b=APqA2aDG4PO8gP0i24S38vTAeKCUXvcGGIgmkaidx9BhY+KCtYmaGMGFoJxzAn2peg
 dpU6HMkx3ffIXQ44656JC5Bes6VKlqA6wdBy+JxdOaY6ZbFrHWZbyxR1aZKsrtQuDen9
 fKteONy+l5W0EdSrJpRMHBrhkiVJh9pRztRzAT7GOKOHGs4LWjelsanEwFNLRW6zEj0W
 GotOF2iWWp4YC52C2FjpTip8a5NWLSHQfHKzhe6Rcx7r3XIB6Ur0PvVxoCA9s5SFJDsQ
 8R5S87uv62RS29fAGRqhcGawVzhmrh/vMWdqXSeJ+8HJ+QoTlwLakz82un+JqGkWdUGR
 9BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696693405; x=1697298205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/XmnQ8BulCB8LjvQmFruCYlEAR5yQvD41aixSO30z8=;
 b=cZ/r/R7Wg+h4h8ID4czJNiY/QIgQtOrCUe8DAG+H8YVdjYklVL0HW1VJFGpY8TUqQT
 5zAqRp2a+KpfyXJl/rm9gMc0cTuHErB4MhwEFtOs1Aum/wq7IqA9We7qeuB2H5sKAZFA
 GxvOglizmYPo2IwuKPpjnMZQ2EmWbGNWkSN0E9B6mV5/eiRIgsvgn9qEkQKQ/tG+M2ZH
 18lSGZGHKn6Ra6kRtzr12QiTsh0O1ctpxzawTFchSNwNhXFHQzzsrOyfjpeU3BKmHMvi
 AgB1ywFvqJDAfIHNalzq7j1FSVLckEIG5lKyIxNXHoqxNoqOBR2Wm9H7XTWbxyeJoF7w
 z3UA==
X-Gm-Message-State: AOJu0YwzlhcyX9Hz2se/VKLnqq8sD7w2eZyVcsAwD6ilAAYRqc0c/Kd2
 xodnWk1+wXrqAnGQjqukYI1pBz15YPo=
X-Google-Smtp-Source: AGHT+IHZV4+w0lDRBs5HTW4DdFO5OTdaorE0aKrM46lFABN999Y0bQFFk+WF6LoIW0B0OVpRzvXT1g==
X-Received: by 2002:a17:902:8f8b:b0:1c5:f0fd:51be with SMTP id
 z11-20020a1709028f8b00b001c5f0fd51bemr10068331plo.69.1696693405079; 
 Sat, 07 Oct 2023 08:43:25 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:f940:d30d:8b60:5b64])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a170902eb0400b001b9d7c8f44dsm6053629plb.182.2023.10.07.08.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 08:43:24 -0700 (PDT)
Date: Sat, 7 Oct 2023 21:13:18 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Message-ID: <20231007154318.GC20160@atom0118>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
 <20230923173652.GC159038@atom0118>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923173652.GC159038@atom0118>
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

On Sat, Sep 23, 2023 at 11:06:58PM +0530, Atul Kumar Pant wrote:
> On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
> > Adds a check to verify if the rtc device file is valid or not
> > and prints a useful error message if the file is not accessible.
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> > 
> > changes since v5:
> >     Updated error message to use strerror().
> > 	If the rtc file is invalid, the skip the test.
> > 
> > changes since v4:
> >     Updated the commit message.
> > 
> > changes since v3:
> >     Added Linux-kselftest and Linux-kernel mailing lists.
> > 
> > changes since v2:
> >     Changed error message when rtc file does not exist.
> > 
> > changes since v1:
> >     Removed check for uid=0
> >     If rtc file is invalid, then exit the test.
> > 
> >  tools/testing/selftests/rtc/rtctest.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> > index 630fef735c7e..27b466111885 100644
> > --- a/tools/testing/selftests/rtc/rtctest.c
> > +++ b/tools/testing/selftests/rtc/rtctest.c
> > @@ -15,6 +15,7 @@
> >  #include <sys/types.h>
> >  #include <time.h>
> >  #include <unistd.h>
> > +#include <error.h>
> >  
> >  #include "../kselftest_harness.h"
> >  #include "../kselftest.h"
> > @@ -437,7 +438,7 @@ int main(int argc, char **argv)
> >  	if (access(rtc_file, F_OK) == 0)
> >  		ret = test_harness_run(argc, argv);
> >  	else
> > -		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
> > +		ksft_exit_skip("%s: %s\n", rtc_file, strerror(errno));
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.25.1
> > 
> 
> 	Hi Shuah, I have made the changes as per your comments. Can you please
> 	review the changes ?

	Hi Shuah, can you please review the changes and provide comments ?
	It has been quite sometime since I uploaded the change. If something
	is to be improved, I'll gladly do it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
