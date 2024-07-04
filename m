Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545551AED50
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102138; cv=none; b=ob1dqgqiwY+qbAUnquWACl1GxXWgIaWtFEReX7bHNdnsB1Cb32YlvK66WLRabY9p83MdH80B3EKj7PkhorrPbNkDPvMPyj2C09l7zNo12nabOyBdLNAy8NYzbwDKCnZM7CWS/6/wAnYpx1KLjgvwlX1nf5D+wosnmpHZ9fpK7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102138; c=relaxed/simple;
	bh=OjnbuG9TO3j0bqvuijnRXhWJSCu36Kq2cDcGRW+hUIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StYgFrD3JIEJSBXkm7UVHArmGQWqZqgjI3arglV5hL6oaPiQzjN2ZFqAzbjW50o8WRD0FHILJdmPQUxsRv5O88ZYSXPBZpgEHdzimcq9/1nekuqYjZuR6p/v4guV6PedOZpszEV4s+QLzpyUFHNGfLi2LmLUrAs36U7NNzNPDpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vt5/hfGd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vt5/hfGd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D950B80C02
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxX8GIAqJtLy for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 14:08:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF8F480C01
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF8F480C01
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vt5/hfGd
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AF8F480C01
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:08:55 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-58c92e77ac7so9877a12.1
        for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Jul 2024 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720102134; x=1720706934; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OjnbuG9TO3j0bqvuijnRXhWJSCu36Kq2cDcGRW+hUIA=;
        b=vt5/hfGd8h+336qh4Y5RfRgYPMM1NXpM5ZSff1Q42QOtAYAeQlIOEVc18g121Xo6J6
         qCdmXBcMpux0Kp4vG3/GLH15ejSRVWr8mx0EnqX6r2hDZTFtEb7RPUxS/AG+mauQ5u4v
         m13c10gH3UenGQ8L0WUgTbRvuXl1mqVwgu811BkuB/2e95Hny/Yed854LIuBlpbBoPT0
         M3s+VH3OaPgpMCEbMIbAEXHFvnWMGSqO/A87TBK3GU2SyUjuTs2PjPs23VXzQCYraVAk
         vO5ZOO4N18fJuDy22Frb+7Ym8YOdRjZVyxvxywbyI5Pf3dxkNJJ3l+KWQ3lpVoEEOQ1W
         pSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720102134; x=1720706934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjnbuG9TO3j0bqvuijnRXhWJSCu36Kq2cDcGRW+hUIA=;
        b=gk+dNkEawyy2nJDAdClFTxkvJpy5Dxq6tt7dI5LKtMv92pHqZCLnZ1dvu8ItdL6//N
         D3HMj/QAZ7H00IQKhMmmnVsfWXWjehiIf1dmLOVPRw2mxqW2RNX9p6iiyIPHHrfICSHm
         oQUwgWG64C7vHEAutSDVehq8z3zQfQKMDxSAGTw1Y7YeM/CbSNBt+Ih6N76c7X6PzlXu
         JbQsVSp9SZDeTFxIfzLRA8AGysC2SLoTa/2onZFLbwg87q78HJtnq+7yfGmKXtrTpcK5
         XlP37ImU6C3ZT7LY85JS6L68kaGjEdVyBFZjQBSLj7i7w0eU/XS00HGG1bSO0KiOxNI7
         srvA==
X-Forwarded-Encrypted: i=1; AJvYcCVM5DvdH91lPWnC7+YpDMqClgYn/+x69cCWtOlcSWSo8M0EBvWXn4BhkcAjW871ONpoa0WcJKgGPD0k4kvQq57+3p2fdVAAvd5/o0HuPbQL8k7fCcMiLeF6fT7ovu45
X-Gm-Message-State: AOJu0YxnKUk6VUPhS9w+nicceYkcqJNIXG074FeF90dlVlXq2b800Vlt
	po/aYBr36nw5NrVfENHuYtiZhjSz1Ux5EfZAup4JmxEDZbi/2wI5TedMY1ntRJdWS+9tt4QNR24
	Cot2/K0jBr6h5z/Zq34S245HuVjbfv6KPuSsd
X-Google-Smtp-Source: AGHT+IFNnwi98SKMXkQJ3oJUKdSHHCJvcB2RfS4C3O9g2BWDLdJHEL3niZX6BcFP4guB/up0cv3ENf2NQHdkJ1jjNaw=
X-Received: by 2002:a50:d49c:0:b0:58b:5725:dedc with SMTP id
 4fb4d7f45d1cf-58e02738dbamr140013a12.4.1720102132332; Thu, 04 Jul 2024
 07:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2023082746-antelope-drop-down-5562@gregkh> <20240704135057.1174408-1-dvyukov@google.com>
 <2024070416-hatbox-playlist-9886@gregkh>
In-Reply-To: <2024070416-hatbox-playlist-9886@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 4 Jul 2024 16:08:40 +0200
Message-ID: <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
To: Greg KH <gregkh@linuxfoundation.org>
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com, 
	Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	luisbg@kernel.org, salah.triki@gmail.com, 
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jul 2024 at 16:04, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 04, 2024 at 03:50:57PM +0200, Dmitry Vyukov wrote:
> > Hi,
> >
> > What's the kernel policy for such cases?
>
> What "case"?
>
> There is no context here at all, and I can't find any patch on lore at
> all.
>
> Please always properly quote stuff...

It's not easy with kernel lists. I used the lore suggested reply-to
command. Here is full thread:
https://lore.kernel.org/all/20240704135057.1174408-1-dvyukov@google.com/
