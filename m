Return-Path: <SRS0=2i/r=M3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEADC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 19:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E2B600D4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 19:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27E2B600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFBFA40298;
	Wed,  4 Aug 2021 19:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y65HvnuBc0v6; Wed,  4 Aug 2021 19:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF7FF401D2;
	Wed,  4 Aug 2021 19:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA9EEC0010;
	Wed,  4 Aug 2021 19:13:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54E26C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 19:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 301F940288
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 19:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUMw52h08tHJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 19:12:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E535401D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 19:12:58 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so10225245pjr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 12:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QT28ajSTVuGEMy6x5AOgauGK6QgvNJIGU/1s5snnFgw=;
 b=YxZRNuQeW/ASdq5AyYsAZs0yUbPmSVogGn9WD/x0nzjgYn2QdgfTDIfi8DufhXub4/
 rJijm4XQlHz5wnSMfBgH+MUIPuyoDp2aiJEVAM9/2g10Ru51+RnFgZf7AeHM+UM2WaYD
 ASbrWruF3YSyu8y3NM9wk4nhXUOujNTCymFAJnRaEjRBHG83i804AwFd9Vvn+FEbtyro
 h1pfVDOLbJqsj1jS9F9MCh5R0EyXkJfZ9d0/EqSRfToArBYpbVLw3fUZLe2hlJDAIjfK
 97ZgmL6y/vUYo4UTqjBVZaXrRTfN7x7CVPP+M+5PpfT4KxgNIWQxsJzoqF6FJ+THM4zM
 K0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QT28ajSTVuGEMy6x5AOgauGK6QgvNJIGU/1s5snnFgw=;
 b=ohdYdxrVLDfX4G196/cY9LEVVN59gk+Ih/WDkuSTz6m5arHb2kzJRRvQ8TFvQR/Ni0
 B2TBwYf1TzaWhFQpLetiKML6nK9y6Ejlt5g+1iCc86oTDuot4V+ohKhvjyoGtFBuyFd+
 SKTuGaSkaHhW+7oHvXKYt3Q+tuT0yuC3Ytqf8+vth2rDAII1JD81f3Jeh5QOqGqmttfT
 /NghrtQwSWPw70+Xq815FATqFmNf+afQmSqFyY193SYlCDnllMRCoo2l9m+FZQAFLtnW
 +Z8AaoZeldkAoA1XWF7J+pmvJQx8oBSRmXmJGnRIXvbYNNDkdX/6jGjkjdOzTXIOdkxW
 6dIA==
X-Gm-Message-State: AOAM531AvcBcSplNpY1sVi3LotRfombKYcT+VGJihPzZLAvVsJVdtWaD
 CX60uR0C2nT7iNUmcBwJV6s=
X-Google-Smtp-Source: ABdhPJyRKQMHEkguvVcPnaaduyFBTIa5qGIwuyIubklBQ81rd3fVT3RN+Je9W2+Csse2HXmQz9cTwg==
X-Received: by 2002:a17:902:7611:b029:12b:e55e:6ee8 with SMTP id
 k17-20020a1709027611b029012be55e6ee8mr592129pll.4.1628104377546; 
 Wed, 04 Aug 2021 12:12:57 -0700 (PDT)
Received: from uver-laptop ([2405:201:6006:a148:b740:13f5:212a:35f0])
 by smtp.gmail.com with ESMTPSA id o8sm6936816pjh.20.2021.08.04.12.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 12:12:57 -0700 (PDT)
Date: Thu, 5 Aug 2021 00:42:42 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: Replace symbolic permissions
 by octal permissions
Message-ID: <20210804191242.GA4956@uver-laptop>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142131.17192-1-utkarshverma294@gmail.com>
 <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Aug 03, 2021 at 08:11:28PM +0200, Lukas Bulwahn wrote:
> On Tue, Aug 3, 2021 at 4:21 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > This fixed the below checkpatch issue:
> 
> Use imperative; you can drop "below" here.
> 
> > WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> > Consider using octal permissions '0644'.
> >
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Usually it is Suggested-by first, then Signed-off-by at the end.
> 
> Do you find a pointer for this order of tags on the commit message in
> the documentation, e.g., in
> Documentation/process/submitting-patches.rst?

No, I didn't found any such rule in the Documentation files.


Regards,
Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
