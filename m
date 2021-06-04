Return-Path: <SRS0=HjQz=K6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B777C4743C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Jun 2021 21:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE46561164
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Jun 2021 21:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE46561164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C52060627;
	Fri,  4 Jun 2021 21:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XS2-6C1w5P_Y; Fri,  4 Jun 2021 21:17:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B8E160621;
	Fri,  4 Jun 2021 21:17:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F4057C000D;
	Fri,  4 Jun 2021 21:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56ECEC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Jun 2021 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D7AC40657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Jun 2021 21:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ne4s50791u6y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Jun 2021 21:17:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9537B40420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Jun 2021 21:17:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u7so5132090wrs.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Jun 2021 14:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:to:from:message-id:in-reply-to:references:date:subject;
 bh=SXj2nh+pqxyO0k2pdvHN9NkPnbIW/mfFCny5zeikkzY=;
 b=X4iX+LcJ1GoMerIgrnpvPTGklilW1xVFT24ECgHxri2Typ3wXFQHNR16XRJ/kVAtN8
 cQUSXy0kMBapqhERfvga0gCzGlyYbIpsvYtL17o8/IKNW/3SHGy05VHrooo1JQBskZ7A
 yn509qnp+N3Eg5lt8cT4Ivs6MJY/scDcK7/Upktxmc62kMlmFZrxWcARaImXfNmmHeOg
 K6xTTWKTGG6yKAw2S8QWo97h5QzIjt9WXRqYS8Iq1+Y7BIHwm+mPWNNwLb4PeKgUoPQg
 MyXd6kXWtdecBk+yLvxXNzEJsqw5XCXCbCjShHxtN/u3wezkvtCxc50gamRql+RCHekp
 k4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:to:from:message-id:in-reply-to:references
 :date:subject;
 bh=SXj2nh+pqxyO0k2pdvHN9NkPnbIW/mfFCny5zeikkzY=;
 b=Ly+OxNnqsgstMj9/0v8z5ez3oe+vWctmuU4iIfGs4WL063WsFEyFr55j+TA5MYnMhC
 TcKKDefv8KW2JglR93uiWrG3LicDX6G2zJVsjrhY4La6RzMs7ZuBl3+dzIbRJdDy094M
 eTwJfbMvBNiBFHPGrRL8DZjFyxbtDPwFnqDJGs3aFR3F4yi1ootKekAAl1o4nJs7AOji
 uOczYtVjV1a33GykLS9Y3DZlbiV5uTAEYQzpFEcPqFCkw30Z7UXLkp2P+B3CuJ7yJ7Dk
 /tLuSjmfVUG8V5P3EY6N9L4Fjs/7p599pPfGlJntmZTgUrGSUZqrKbC1IKoim+hyOhly
 DNTw==
X-Gm-Message-State: AOAM531OJVfvc48GG6mBgbosI6Wi6LoOxNiVl2Hhiarf8IAxSZouMTnl
 D+xoQn2/yRmUfYM7kLV2iHR+gTv6www=
X-Google-Smtp-Source: ABdhPJzoc2mEfDgis7OJi7rPK/Wmy16DV80F8ttvfKqQFMUnPyqT/Y/iEBzcpJSrUKqZNVQkG47GVQ==
X-Received: by 2002:adf:a550:: with SMTP id j16mr5821717wrb.25.1622841440922; 
 Fri, 04 Jun 2021 14:17:20 -0700 (PDT)
Received: from localhost ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id u7sm2314423wrt.18.2021.06.04.14.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 14:17:20 -0700 (PDT)
To: Pavel Skripkin <paskripkin@gmail.com>
From: "Kurt Manucredo" <fuzzybritches0@gmail.com>
Message-ID: <13243-13424-curtm@phaethon>
In-Reply-To: <20210602093645.47501d64@gmail.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com> <12537-32529-curtm@phaethon>
 <YLZVnNNAkAQFvSm8@kroah.com> <16463-26867-curtm@phaethon>
 <YLcgrGQ0phBpvHxQ@kroah.com> <20210602093645.47501d64@gmail.com>
Date: Fri, 04 Jun 2021 23:15:30 +0200
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

On Wed, 2 Jun 2021 09:36:45 +0300, Pavel Skripkin <paskripkin@gmail.com> wrote:
> 
> On Wed, 2 Jun 2021 08:09:48 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Jun 01, 2021 at 11:28:00PM +0200, Kurt Manucredo wrote:
> > > On Tue, 1 Jun 2021 17:43:24 +0200, Greg KH
> > > <gregkh@linuxfoundation.org> wrote:
> > > > 
> > > > On Tue, Jun 01, 2021 at 04:33:09PM +0200, Kurt Manucredo wrote:
> > > > > Fix shift-out-of-bounds in ___bpf_prog_run().
> > > > 
> > > > How is this "fixed"?
> > > > 
> > > Fix shift-out-of-bounds in ___bpf_prog_run() by adding extra
> > > boundary check in check_alu_op() in verifier.c.
> > 
> > Great, say this in the changelog text.
> > 
> > > > > 
> > > > > UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
> > > > > shift exponent 248 is too large for 32-bit type 'unsigned int'
> > > > 
> > > > What is this from?
> > > 
> > > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> > 
> > You should provide this link in the changelog text.
> > 
> > > > Any reason you didn't cc: the bpf maintainers and developers?
> > > > 
> > > Yes. I send them to you, the mentees mailing list and Shuah, first,
> > > for review, comment and help. Is this not okay? 
> > 
> > Ok, didn't know what you were wanting here, you can always ask
> > questions like this below the --- line of a patch.
> > 
> > > > > Reported-by:
> > > > > syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
> > > > 
> > > > Does this pass the syzbot testing?
> > > 
> > > Yes, it says 'OK' in the 'Result' column at:
> > > https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231
> > 
> > You should also say something like "passes the syzbot reproducer test"
> > in the changelog text as well.
> > 
> 
> Other possible way to tell maintainer, that patch was tested
> somehow, is to change Reported-by to Reported-and-tested-by tag received
> from syzbot. It might be more nicely :)
> 

thanks Pavel

kind regards

Kurt Manucredo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
