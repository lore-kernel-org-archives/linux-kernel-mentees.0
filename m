Return-Path: <SRS0=N8k6=K3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AFCC4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 21:29:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC46613B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 21:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC46613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2390A40197;
	Tue,  1 Jun 2021 21:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISiR27_O_k1A; Tue,  1 Jun 2021 21:29:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3490540103;
	Tue,  1 Jun 2021 21:29:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1597DC000E;
	Tue,  1 Jun 2021 21:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36885C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263C983A8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgK9MdBWCFut
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 21:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31A3283A88
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 21:29:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so421631wmq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Jun 2021 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:to:from:message-id:in-reply-to:references:date:subject;
 bh=MS8SexYSu+4bquWExim2S9zlrrcrFd+ibrQtE06U5EE=;
 b=LxvnlekKw0YcfdBVHdrlPSuK1vgNhUSn2y/1QJJ/qE9QIOYU8bvgoAVDQSxK7GJfZM
 uWDkX5UkT8/MKMegAoQiko6IQPzO26A7fWR/5Yjy7KLRVSAMJ7zCv6Tv26SOd0WlrQEC
 Py2lmg1FcD/VsLFfeYbx8jOv2qCFcF2VNfM/wtInBgCTrdfSZ98EBKgxVS+4gS7IodDo
 zxYI61GzWA6/PeZZEkNcW+ZuJ+1meaONWjmlnoRbHuZPpI2RI68JVt8TrltkKLemxaUl
 M6um7Pf8A5wikmfi8aRZEXPkM8yVccEQEa+INJicfTynfeTpc5uvKHwi0ofqSMYZ7gVd
 FG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:to:from:message-id:in-reply-to:references
 :date:subject;
 bh=MS8SexYSu+4bquWExim2S9zlrrcrFd+ibrQtE06U5EE=;
 b=CGfJcskP3TcyEz0GPio/xiASYbUONvBxm2F6T3uo182z3LPe9eHyH8ug4oc7yZQsV/
 wVx0Qq87vmSHpnAEcz2xFGSVXlh1umPpNBdP6SE/GHaBCaDh/T083Z8xERCCCHHoLhyF
 ZoSI2ZiO1oAh56W/MiTXGzdajWP2ci/8QwC5WS1rkgjkN0ZFhSAD4xIrR29m935xEAi9
 SuQVbkb1hDSIjUqbv4HVuL20LMi7UM/nvXdJTSwPGfBfnqYmsRRdBGTE4vcEF2NIAExx
 4+xRZ31eNbECdLXeIxN6XlHIwR8GGv8ZQx1FhKRq2joVROht7uF4K11CgQaNlCBZOhY/
 NxkA==
X-Gm-Message-State: AOAM533CcDWNM55ERm+I0GxZNoUtG3XKAPFWcY6FredGecK/Q1mhq9qL
 H/GfNlMQKCfvOmmDK6ptpxijoa0gJC0=
X-Google-Smtp-Source: ABdhPJw4PF7xQQBj5oURwzGLeb+LaSrlQpqqXx+V2keHNXJxguFSrvGSMAsdSwgR/vmrgOup9/5D4A==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr3571730wmj.63.1622582949399; 
 Tue, 01 Jun 2021 14:29:09 -0700 (PDT)
Received: from localhost ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id m65sm591433wmm.19.2021.06.01.14.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 14:29:08 -0700 (PDT)
To: gregkh@linuxfoundation.org
From: "Kurt Manucredo" <fuzzybritches0@gmail.com>
Message-ID: <16463-26867-curtm@phaethon>
In-Reply-To: <YLZVnNNAkAQFvSm8@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com> <12537-32529-curtm@phaethon>
 <YLZVnNNAkAQFvSm8@kroah.com>
Date: Tue, 01 Jun 2021 23:28:00 +0200
Subject: Re: [PATCH v2] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 1 Jun 2021 17:43:24 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Tue, Jun 01, 2021 at 04:33:09PM +0200, Kurt Manucredo wrote:
> > Fix shift-out-of-bounds in ___bpf_prog_run().
> 
> How is this "fixed"?
> 
Fix shift-out-of-bounds in ___bpf_prog_run() by adding extra boundary
check in check_alu_op() in verifier.c.

> > 
> > UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> > shift exponent 248 is too large for 32-bit type 'unsigned int'
> 
> What is this from?

https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> 
> Any reason you didn't cc: the bpf maintainers and developers?
> 
Yes. I send them to you, the mentees mailing list and Shuah, first, for
review, comment and help. Is this not okay? 

> 
> > Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> 
> Does this pass the syzbot testing?

Yes, it says 'OK' in the 'Result' column at:
https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
It's the latest from fuzzybritches0@gmail.com.

But at this point I cannot say if this is right. Should I send the next
version to everyone?

thanks and kind regards,

Kurt Manucredo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
