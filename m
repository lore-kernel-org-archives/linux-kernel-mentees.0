Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBDEC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 09:27:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AE96104F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 09:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37AE96104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04FC9839A4;
	Thu,  5 Aug 2021 09:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_LZtiWHWMlX; Thu,  5 Aug 2021 09:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C91698397F;
	Thu,  5 Aug 2021 09:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF7A0C001A;
	Thu,  5 Aug 2021 09:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 476F0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 09:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E8BC401BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 09:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Mtz7b81NLj5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 09:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EB0D401B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 09:27:00 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id w17so7975061ybl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HIDgWJtXpYSzQe93Ru1SWwCzXLQLVln6gqymGMqzMU8=;
 b=YcdF6veGuiBmB9oIrRexjajGkIc6s8fAo31xDSTBOE0/c7YqfyGmqVtrFylVmb4Gy/
 ZURDUHU6SydXTIRsIlBEf3no+sM7ySRD0ergdA1kAJbRmPR/4De44ZGPesVHs4V3Tag8
 riYKugK7wTD496xVn9kZfV+ZkxhUa9CNn9ZFw/o74cWHyV94uZDLFkwerUAXxrBHUT1I
 2TeQWN/Z0C4wZkevsfnANkNvb5mzlSGPHk6EaqQ8rsYa9cJOXXkUmKEzdWmFjWIUXKBB
 L8/ZygzocR97r9Lloyh7y9jMRu1R/9UA/0RyMwoTiaVgNYFWZ6Ov4CyXRnCTUHXt2zpq
 rxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HIDgWJtXpYSzQe93Ru1SWwCzXLQLVln6gqymGMqzMU8=;
 b=AygwIqLOkXTOHYv2ESeA25dCedMGzK5Rt7ksdojxcQV8VHnar+tfBXKe2s2K2xtRAe
 Dhq8K1azPfT1NKU4G/fctSmjaajmF7qBvqqiDIuC3KLb8zt2FkOXTw1kVG06lxLyx4S/
 CCdTuA2icEWW2KaiEPf4XsIGqb2xRY8+Hhf0fsmg4S+wjndvS5xrpGJWE+09VbQnnmnn
 k/baeWT8Z1j315IwMsiXg2qtXMHgTqxGTvd5Rhe3/MfvEwFGGB3vOVqHxMMI3H+nzkx/
 BXKfgt7SzKRn/OnH7edFRFyyQzpOnkjkOrdJUa7ZuX8uElZrZCFHaZg6Jq/YCx2RSGm1
 tI7w==
X-Gm-Message-State: AOAM5331wsZ6QRtYamv4PdIIzTHOA3kGsFCFY0hthR9pQ+DV+RwXugAH
 qdYVyP2L12znj5OqD8mVf7uT7cfqYgGpPzrUAYk=
X-Google-Smtp-Source: ABdhPJwL2ygUjGn2PFjzNVVAkgoy32mBPOMMD84VDT9j011Gr5O2kYlpzHAMqHwhf2nIGqhXgClUBFozJne0Q81c4Hc=
X-Received: by 2002:a25:f310:: with SMTP id c16mr4364799ybs.464.1628155619977; 
 Thu, 05 Aug 2021 02:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142131.17192-1-utkarshverma294@gmail.com>
 <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
 <20210804191242.GA4956@uver-laptop>
In-Reply-To: <20210804191242.GA4956@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 5 Aug 2021 11:26:49 +0200
Message-ID: <CAKXUXMyPWbP1zQWOg6o2jGcE0tOMBvTXfWw0Bk3edy2s_WY+Ug@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: Replace symbolic permissions by
 octal permissions
To: Utkarsh Verma <utkarshverma294@gmail.com>
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

On Wed, Aug 4, 2021 at 9:12 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> On Tue, Aug 03, 2021 at 08:11:28PM +0200, Lukas Bulwahn wrote:
> > On Tue, Aug 3, 2021 at 4:21 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > >
> > > This fixed the below checkpatch issue:
> >
> > Use imperative; you can drop "below" here.
> >
> > > WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> > > Consider using octal permissions '0644'.
> > >
> > > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> > Usually it is Suggested-by first, then Signed-off-by at the end.
> >
> > Do you find a pointer for this order of tags on the commit message in
> > the documentation, e.g., in
> > Documentation/process/submitting-patches.rst?
>
> No, I didn't found any such rule in the Documentation files.
>

I think you could try to create a patch to add that information on the
ordering of these tags here:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

You will find the source of that documentation at
Documentation/process/submitting-patches.rst.

Do you want to give that a quick try?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
