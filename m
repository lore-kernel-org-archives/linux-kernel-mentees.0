Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A07C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 20:22:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C16820684
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 20:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="WxmbK4zL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C16820684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4358D86A32;
	Wed, 22 Jul 2020 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRgPwWgsTls3; Wed, 22 Jul 2020 20:22:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0086869F4;
	Wed, 22 Jul 2020 20:22:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9D54C004E;
	Wed, 22 Jul 2020 20:22:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 604D6C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3BAB8203AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNJK7bvpdeS2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:22:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0975120387
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 20:22:10 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id 2so1641104ybr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 13:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5QkphWxYyazumKClniN3MUn39GFFNV/nqPhj6OvEhnM=;
 b=WxmbK4zLKLPTSwQ1E7baf6yDcVLqwcJsyAhxGJR3HqQXrPyLqw80Ilsz4CmV98R3E3
 ykXnZbm22OEkV71kwSuxesfswDStT/W7VQsHh5BYN3mqSpnl92ADXaYVTEkA50YlrJBx
 eX27OG4A5GtogpwQqq9cNK6uhUCwa7ltuuXg6YBp1Vn8HrJAevfa13SL064Y8IjVi2AV
 x4VlSbu6eFUXR0wtXKPl6ISo7KiWovLNe00yv6GKSB754nY64cFgkTIhKunjaXspBlgE
 zkMsHCKN1X0eajnW2LMh7Mq03QC9Tr/Quph6S4ULRkZF54a6Ug93P8sOt9asK5HNUTkX
 /9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5QkphWxYyazumKClniN3MUn39GFFNV/nqPhj6OvEhnM=;
 b=MqUVOZW52Dhj2AWHYp18eZ8uDfgds9M7+02sPhTEa+e2+qPJKuILW5OtagNK9LG1iz
 yzpKB/wsq7yZ2/92Z8ouok1Vl74wLka+9kyKXRQUwP1e5cfGBteaaFQcgntdq5DGvWjQ
 iVoSEpZ8IY+TQHZxKKchIIeT1dKVOmbv0yOrsDo+4Rn96LuD5Sw/Fkl12LHjDnonsW3j
 8YK5r6odtIQi0X/FF2IL8n74OH+7Pyf7UGHaKsrHAACSl4+hX4PbOSubTNFeZMl+hHL8
 im9j0Lx+PdzQLTE/l+93FV6JTGLXW6H4LDf33CJJlJ7zlm2FnO10rn5ZsgxoA6LaRcYh
 6i0Q==
X-Gm-Message-State: AOAM533vrarbwjIkh89gljJm3r6hVcSIiQW5b9Ib+zHDiuw9WtyLrd9P
 2gtKILYrIAEcuK1eiGX24HHtWyPAVGWhIaNUajjT6Q==
X-Google-Smtp-Source: ABdhPJwzOAVu8VbvSYiVCfE5fyc/hdk3WFhsSAt26VME4J8FZBKqRr512J8/MfvNYYd0oO8b8AzGIYGc9Pk1gR6M8+c=
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr1566548ybg.488.1595449329066; 
 Wed, 22 Jul 2020 13:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
 <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
 <202007211911.666E080@keescook>
 <CADQ6JjUgVXBfHfb=V2ajwm=rHi12rxiqEtpivjY03xZbp6k7wg@mail.gmail.com>
 <202007221244.4E3C9E45@keescook>
In-Reply-To: <202007221244.4E3C9E45@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 22 Jul 2020 17:21:33 -0300
Message-ID: <CADQ6JjXmXnHr9O1q3h5smVosvffFByJTtr49P7H0eT9A7+0pxg@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
	to KUnit test
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

On Wed, Jul 22, 2020 at 4:45 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jul 22, 2020 at 03:29:27PM -0300, Vitor Massaru Iha wrote:
> > On Tue, Jul 21, 2020 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Tue, Jul 21, 2020 at 07:19:12PM -0300, Vitor Massaru Iha wrote:
> > > > When you talk about end-of-test summary, is it what is written in
> > > > dmesg and not the kunit-tool?
> > >
> > > Right, if I build this as a module and do "modprobe user_copy_kunit",
> > > what will show up in dmesg?
> >
> > No, It doesn't. I'll put the messages again.
>
> Would it be possible to add that behavior to the core KUnit output? Then
> all module-based tests would include a summary line?

I will check what can be done.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
