Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85356C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 10:22:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5BBF64EC4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 10:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5BBF64EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BB794330A;
	Fri, 26 Feb 2021 10:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-_yyVONONQB; Fri, 26 Feb 2021 10:22:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E56543310;
	Fri, 26 Feb 2021 10:22:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 767FFC000A;
	Fri, 26 Feb 2021 10:22:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFBA1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 10:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED1D43310
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 10:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gp6oGixtmAkb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 10:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 274384330A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 10:21:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id o11so1189849iob.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BXuN/OhxLOmuaTvPo1WVoYs9rPWwpwpRK9bD5YtTbxw=;
 b=sVoNMIIsZ776rwWAnr8L8GdvZDCzUg03yC42iOm0Z6DeoOlP0NB36bLz/RzHXbdGlF
 YnDNujXlXA4UKCUXumklH2ADESPGAlS/dmSl/7tN+etJZjTqgxeTkfM6dR2x7agNThCv
 rWpIx//iN7rnjn1R8A688uHAR9wqno8poMG33exGhHNaJ9jJMOfZDEo6DH/NDA6Gr88u
 sP+2USWyYC+O1ydYU2Q+nw0KONLfiLXuvnSMmHQt9kdTRx160klMuNCm+N5W1t0/z8CM
 U8vFlgYZQ3ZMLSTcyoGmqhbZiY1KdkmhIvC6/HU93nCSCZYQF/px3rb0UDznNRPy531U
 aTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BXuN/OhxLOmuaTvPo1WVoYs9rPWwpwpRK9bD5YtTbxw=;
 b=NoMqeU/YMruGzZkaZTamS5H1J12+bL37LUQh+987q4/7M0K4irboL/s+esoPDNtzoR
 72JSGslJVvnyCIpuibsJSIxLj96zShg9OcmcwOv7aXIhiP+T65SvMTdUhJ0Xt4es//3n
 FX0Wft34JkgKP3ciPZ0StbTpfEhR9wieD9478zZ7SGXP9iMGdao5fWJTWJpZaHWw78T3
 xLNB1nI4/K26nIjburE672p07+TazkqEd92IZao/qZmHz4y1Hmf72YAjdmCpMS+3RLeU
 P9JURIYTTsUyrfoeuvZSQf6WzMtSbixAnuFFA1F5fLMKn2Ru6BgYC9P+HnbDP7telhra
 +X7A==
X-Gm-Message-State: AOAM532OP4EBDZbrQd0ZzOG5fUQRZTFTB1aeQnnM/y2ozaIJzmX4mbcU
 U3A49k4ZUAnX+47CbTFrOEgVYAPuB97BJ13yYdE=
X-Google-Smtp-Source: ABdhPJxHg/mCi+jiPGWb2f9Y4GoIjLJjCng9e51bf04oXLvrgft9yXBzLnHgEXmvmYXGGx0Xq1rjsXtlj+QRqfUnuyk=
X-Received: by 2002:a02:866d:: with SMTP id e100mr2140392jai.139.1614334918103; 
 Fri, 26 Feb 2021 02:21:58 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 26 Feb 2021 11:21:47 +0100
Message-ID: <CAKXUXMzstVLAj7KBHxOdW4BYBg_paDOdJfutx4rPYxU+jfcKUg@mail.gmail.com>
Subject: Yet another kernel-doc parsing issue
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
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

Aditya,

here is another example of expressions that kernel-doc cannot properly parse:

include/rdma/ib_cm.h:571: warning: cannot understand function
prototype: 'const char *__attribute_const__ ibcm_reject_msg(int
reason); '
include/rdma/iw_cm.h:224: warning: cannot understand function
prototype: 'const char *__attribute_const__ iwcm_reject_msg(int
reason); '
include/rdma/rdma_cm.h:348: warning: cannot understand function
prototype: 'const char *__attribute_const__ rdma_reject_msg(struct
rdma_cm_id *id,                                                 int
reason); '

It is probably easy to extend the current patterns of attributes in
kernel-doc by just __attribute_const__, but that is of course only a
quick hotfix for kernel-doc. You can start with that.

But maybe you can come up with a better general solution? I see that
there are multiple tools in the kernel that need to maintain a list of
attributes for their internal C parsers, maybe you find a way to
refactor them that they share a common file for recording the valid
and supported attributes.


Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
