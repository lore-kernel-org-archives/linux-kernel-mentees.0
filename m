Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B3211721
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkulDFQP"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473A2418A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 13:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 473A2418A0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkulDFQP
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zN1KNVWyQmJS
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 13:50:01 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 390EC41868
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 13:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390EC41868
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6cf65093780so2188250a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699797000; x=1700401800; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JB2I+B+rYFLkS4fe+E3Z3AcXhS19RY8fRv5WzyVTB9U=;
        b=AkulDFQP9m9RJBtOfPsC4opwKKL7dPTfrkLgx9Odrm6yzG2uDAHumChvzyclBIrHBc
         h7rJ8oiC/YtRHrh6ZY8Ovf7zcYG4GRezSeSIHGx3ertka6Y6mWbjujjQ+EUn01Nx2cDD
         hiAuYfXltgdjSj6900G4ZYtp8CLVWEmuv/35j7VKVmg0BWXKod/ncCpn3ziuDX51RzV2
         NjvbYrreGuLOr0FWabf2No68NUL0HWyC9+3a35FIXVeZqX5qKJJLfvumv4syflKVohUa
         B3JKUuqYEhLMLtDHLvRHrSAf/JIZQvIsI3VfwRCkQ9lFdE+LZDRnZeeBHGEy8rU0jZbK
         A7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699797000; x=1700401800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB2I+B+rYFLkS4fe+E3Z3AcXhS19RY8fRv5WzyVTB9U=;
        b=Z20IgoTbD7UeBYkYsQu55Fbhy2vacjBmVZxp+EzeamLx9DYXCGnnNvF20ExH1irKjO
         kSmuOBvhupcHPLOWmb98pMsFnV4ZhNADNesdx2fxfv97IQpl0fxGzRjWatnt2/mMDsQ0
         ROohXj6Y9kpcqVsatJzEzSoBEYP04OoFcLBL/GGudgv17PEvTPz7F0AJ3webT8HdZp3m
         ynMQk7s7Tc8QCLvo1jQWmTpLEyC8x1LfV8YP0G6VltV+ZeznG59ieOjZJAECrdS8aq0e
         kFAEIy5SS4T+cXbSASGz4DNBE1QRJzEbxxl8f0xL3KSPfeA2fVGwR+N+3dk72FkmkH/J
         JukA==
X-Gm-Message-State: AOJu0Yx+MP/N/HWvAWRP4wl9rH4MGY7IW+/2Io6uMN6TyD6HBH5LMp1P
	CyPBXoZ3I47TlAst+go+X78=
X-Google-Smtp-Source: AGHT+IE47XF45kXA0ihvXDA4astRGQHI6+R4GExIHLFZ33T4m3r1jhFXaC1lvxd5ruxEiOux5/TdhQ==
X-Received: by 2002:a9d:62d4:0:b0:6c1:7927:6550 with SMTP id z20-20020a9d62d4000000b006c179276550mr5393270otk.2.1699797000239;
        Sun, 12 Nov 2023 05:50:00 -0800 (PST)
Received: from atom0118 ([2405:201:6815:d829:c9ab:5d66:b313:f881])
        by smtp.gmail.com with ESMTPSA id j191-20020a6380c8000000b00578b8fab907sm2693829pgd.73.2023.11.12.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 05:49:59 -0800 (PST)
Date: Sun, 12 Nov 2023 19:19:53 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, shuah@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Message-ID: <20231112134953.GA11910@atom0118>
References: <20230817091401.72674-1-atulpant.linux@gmail.com>
 <20230923173652.GC159038@atom0118>
 <20231007154318.GC20160@atom0118>
 <22df3ecb-488c-4d58-8efe-4638fa3d614b@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22df3ecb-488c-4d58-8efe-4638fa3d614b@linuxfoundation.org>

On Tue, Nov 07, 2023 at 02:27:35PM -0700, Shuah Khan wrote:
> On 10/7/23 09:43, Atul Kumar Pant wrote:
> > On Sat, Sep 23, 2023 at 11:06:58PM +0530, Atul Kumar Pant wrote:
> > > On Thu, Aug 17, 2023 at 02:44:01PM +0530, Atul Kumar Pant wrote:
> > > > Adds a check to verify if the rtc device file is valid or not
> > > > and prints a useful error message if the file is not accessible.
> > > > 
> > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > ---
> 
> 
> Sorry for the delay. I will pick this up for the next rc.
> 
> thanks,
> -- Shuah

	Thanks Shuah
