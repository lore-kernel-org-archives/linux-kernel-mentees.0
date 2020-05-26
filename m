Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E780C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 02:27:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE9E207CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 02:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="YofJeHnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE9E207CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74C0185CFE;
	Tue, 26 May 2020 02:27:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8p3IBb1YFij1; Tue, 26 May 2020 02:27:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCAD185CA8;
	Tue, 26 May 2020 02:27:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C12C2C0865;
	Tue, 26 May 2020 02:27:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D66F0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 02:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BEF34879FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 02:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R8Bo+dhdbFe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 02:27:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 73273877A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 02:27:05 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id v15so8818496qvr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 19:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=kKvMAjzc/mEVTpZO8ep+V3zBScPaHmRXXweb2vJv3c8=;
 b=YofJeHnd5o7d5GTI0OypeNRdeu1ysq06NK8fGtCfoqf2KIQMXQGY26AXERewokEcjL
 MJBHsjTp5z2X5GNsib9ioA1rDrpCTQVSSaECiaR+lAIsyvGWWUxYaFDdJVwBZLQxyk4U
 /6OcMbI5aTRG6FplB+K8V1hh+HCtp1kH8NX6uuV/o/oMzrmET4XxIzhTwPNmK/SNFnoN
 Z0gWhM7pheDTr0BXFpX9Bs6SLWwmlvNz+pife1jxnpVI7icDP9iL6FjavwOsSaPaMQj3
 h3hVsvcs4Q5uxmrCzwIA8EQabb+9i+gj6J7ZU9jivDR7/FabYirEjJ/CfSFzFio+9C5c
 uY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=kKvMAjzc/mEVTpZO8ep+V3zBScPaHmRXXweb2vJv3c8=;
 b=qZ6A97qB9X0hyQEfTepTndEG43bxdCn4guFOzmYiDY+3ZDlPGztnNERecvyzCBhO/t
 OgvHcOj+tj+LTfA3lNHSLeZ33ft+sJhmyAaHhiIyQt4vkk5afFsvhvOIt3/iAF9SBLX9
 eF/5KjsT6C0teXyjol9sms3xM/Ss3TwLnGFUoHPSPmHsKM/tEhqBE+xbitcBIldOiSGv
 CEl7AbpmOrEqJzlkRBGwv877a54boBpEnOzLwUzlrLzelBVFessQl3kROo8Bmp042jM2
 Z5enXYRkw8eGrUTaROSsLaOOAIWg1Jr/GSMIPFLqFUE8l43nTz2So9rk7HubAckkLd0L
 VUBQ==
X-Gm-Message-State: AOAM531D5q4Ndrpw2f6UmQGk4tL4TaSLxhSit/gJJf748JM9XXGtiuyz
 ItrQ8r7eri0hoLTWWi0QXSqD7A==
X-Google-Smtp-Source: ABdhPJzBt+Vgk2wXJ8UAQjptPRf86v1VsR74Foleh0D4S5xZtJUZ0VsVSMKeEBXoY0/loY/P8Yhh3g==
X-Received: by 2002:a0c:fc4e:: with SMTP id w14mr18133773qvp.147.1590460024208; 
 Mon, 25 May 2020 19:27:04 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id n7sm15523719qtr.40.2020.05.25.19.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 19:27:03 -0700 (PDT)
Message-ID: <6403abc0c60fcb5069e1cdea0bb7f25b6dc8070f.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: shuah <shuah@kernel.org>, Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 25 May 2020 23:27:00 -0300
In-Reply-To: <b04934ab91fd57e6df35279ad8a2619afb00b452.camel@massaru.org>
References: <20200414230950.83665-1-vitor@massaru.org>
 <CAFd5g47CaeEBiJsiSUtihHQF+OGpfCg76dS2ys2mwy2qn_L5-w@mail.gmail.com>
 <c035d65b-7e93-f948-22f9-73a56193ec36@kernel.org>
 <b04934ab91fd57e6df35279ad8a2619afb00b452.camel@massaru.org>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RESEND] kunit: use --build_dir=.kunit
	as default
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

On Mon, 2020-05-25 at 22:52 -0300, Vitor Massaru Iha wrote:
> Hi Shuah,
> 
> On Fri, 2020-05-22 at 16:40 -0600, shuah wrote:
> > On 4/16/20 5:11 PM, Brendan Higgins wrote:
> > > On Tue, Apr 14, 2020 at 4:09 PM Vitor Massaru Iha <
> > > vitor@massaru.org> wrote:
> > > > To make KUnit easier to use, and to avoid overwriting object
> > > > and
> > > > .config files, the default KUnit build directory is set to
> > > > .kunit
> > > > 
> > > >   * Related bug: 
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=205221
> > > > 
> > > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > 
> > > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > > 
> > 
> > Applied the patch to kselftest/kunit on top of
> > 
> > 45ba7a893ad89114e773b3dc32f6431354c465d6
> > kunit: kunit_tool: Separate out config/build/exec/parse
> > 
> > from David's work resolving merge conflicts. Please check if it is
> > sane.
> > 
> > thanks,
> > -- Shuah
> 
> The kunit branch had some problems related to identation. KUnit's
> code
> has mixed identation, and with that, in conflict correction, it ended
> up breaking python.
> 
> In addition I found a bug: related to the creation of the
> .kunitconfig
> file inside the default build directory.

This is actually related to the other patch "kunit: use KUnit defconfig
by default"


>  Should I send the patch again?
> Or do I make a bugfix patch?
> 
> BR,
> Vitor
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
