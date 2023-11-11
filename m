Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F1018E23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXtLNy44"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8DC841EDA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 16:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DC841EDA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IXtLNy44
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Znne4XlkVrlD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 11 Nov 2023 16:53:44 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2FDDF41ED2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 16:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDDF41ED2
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso3149124b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 08:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699721623; x=1700326423; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tKsYqeTKvyflOZt7aAZyQORAfJRtz6JfB29s29kRskY=;
        b=IXtLNy447+G69ORhRRfFbdTH6N3A1A9VuRUfDKroR2fBVsWi2kX36XHlnGEEGEBGsP
         6q38klJfyNiMAO5IoXKbp0bpqvwAkxyuCGwp+D5p8jSD59tu8PFkWIoAtkHtf1ZfN2KR
         powBcLmdI1sGRfdx2MwkdRCceY6h6eeWMFYkdGCiYgL4yrOCEGzPyBMRgT4eqvHSFLqv
         k1YOUlMtvAuzgj1cRGxe8Vrde0j3Uhrb79/GiPkX6OAgfsHNK+Bq0vlYQRM73LZehgzW
         /Yti6Ep8wA5xKkRDF2Xy58jkS216XhVsbKgbcWHob6Cn7294wQO2Mgde4UTvFa3jSUCE
         /wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699721623; x=1700326423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKsYqeTKvyflOZt7aAZyQORAfJRtz6JfB29s29kRskY=;
        b=PPAxm0L6VU+FX8kN9utr67a/fpPppzxgiuw8fIjkEX/A6FFbkRygBgfHUYxSvZyvZ1
         yanxdw1QcxjlHFHjoIINBqpJy69hQi0v3JWoxVlKaBl7AbKzTm8H+cZKsasRd02J6YWQ
         w5YGQ96lz4+0DVE7C1GrJJ67jKAlh497kJTCI1vXGEsZT4MuXgtFXqG1zrv83hwgftQ3
         i5BHRFMqHMknzM+3tahUSrGaGZTJvQSENv9rF+A7c9W8OULPU2zwLGH/9UnVH84XeiXk
         ohpBoXUXg6ZFmuV7once/kgJHmyUYW+ZEEL2xIVgshhfsCpkIlBnyZtPWq1ttzutp3LR
         uIYA==
X-Gm-Message-State: AOJu0YwHKn4PwCSXbxtRkgeKny0HNnQutpkOj5XuQDB8D7jAzt8bz/DB
	4wTtgLGJK1fftnfIJP7/gfo=
X-Google-Smtp-Source: AGHT+IEKdRyc74l4fdWmW2an++vXfXOSZMnlGaRR0E3c5U0wLIrJ7Q1G0iXYos1atXUoBDYgVhvGzQ==
X-Received: by 2002:aa7:85c4:0:b0:690:ce36:8b00 with SMTP id z4-20020aa785c4000000b00690ce368b00mr2405037pfn.2.1699721623279;
        Sat, 11 Nov 2023 08:53:43 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.83.22])
        by smtp.gmail.com with ESMTPSA id e14-20020a62ee0e000000b00688435a9915sm1459536pfi.189.2023.11.11.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 08:53:42 -0800 (PST)
Date: Sat, 11 Nov 2023 22:23:38 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests: capabilities: namespace create varies for
 root and normal user
Message-ID: <ZU+xkpH09xjzO5IS@swarup-virtual-machine>
References: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
 <0f3a63ff-cbf9-4e06-8f4f-fd22bafa26fe@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f3a63ff-cbf9-4e06-8f4f-fd22bafa26fe@linuxfoundation.org>

On Tue, Nov 07, 2023 at 02:23:34PM -0700, Shuah Khan wrote:
> On 9/29/23 06:53, Swarup Laxman Kotiaklapudi wrote:
> > Change namespace creation for root and non-root
> > user differently in create_and_enter_ns() function
> > 
> 
> Sorry for the delay on reviewing this.
> 
> Can you tell me more about why this change is needed and
> include it in the change log.
> 
> thanks,
> -- Shuah

Hi Shuah,

This patchset was raised to fix below TODO:

"If we're already root, we could skip creating the userns."

Without this patchset, function create_and_enter_ns(),
at this path --> tools/testing/selftests/capabilities/test_execve.c
was as mentioned below:

static bool create_and_enter_ns(uid_t inner_uid)
{
   ....
   if (unshare(CLONE_NEWNS) == 0) {
       ....   
    } else if (unshare(CLONE_NEWUSER | CLONE_NEWNS) == 0) {
       ....
     } else {
                ksft_exit_skip("must be root or be able to create a userns\n");
     }

     ...
}

To fix the TODO, above mentioned if block is executed if root user,
for normal user it enters inside 'else if' block.

Thanks,
Swarup
