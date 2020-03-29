Return-Path: <SRS0=cPux=5O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F2EC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Mar 2020 07:21:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1597620748
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Mar 2020 07:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egGUiNae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1597620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCB348643D;
	Sun, 29 Mar 2020 07:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIEVOLO1T2_x; Sun, 29 Mar 2020 07:21:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D0C386113;
	Sun, 29 Mar 2020 07:21:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51DBDC089E;
	Sun, 29 Mar 2020 07:21:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F90AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1964A882CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZWKsx00M1V7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:20:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F1C6E882C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 07:20:54 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d11so15707248qko.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Mar 2020 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBRt8+k2paszDjk+AWvvybbznwwY03OoRZexgAwjbK0=;
 b=egGUiNaemesGJM4SizgtC8pV1xeaw2lChfdN3Y6Ap+7kYnUO+3ogshbVDDs5jOWZAE
 HfWFUW9kQTFi/pycmC6A5s/iChoTAohnpyT1iQiaB3Gcr6ZxjCD1TziriSplir3ZGhdI
 ssBdo5TmtOTdiwSM8km5QKLuko/WJqPGrbBRmOAGvcbxQ8aAD3Hn7nZFoSq+ScISIoOC
 eszFVfXTezSaLHoKaQ41U5rVwsf17s/U7rKlndv8CzaZN/u+h9kcgSvExdz3U41/b9PB
 sceJZCMlBLzCG8kh0gxGCUl49QX7Ne/zOceNkhoPClyWXGqGutjPXRxwMAC6zc0Rp030
 jqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBRt8+k2paszDjk+AWvvybbznwwY03OoRZexgAwjbK0=;
 b=uMYqDExBFE2QGC3By8Q3ogAOdzrTAOz+dD17iTsupHEBP83wHeIYFh0JoCQVGTrIKR
 BH6RljR+N6gD7r+Lu8RjMRBGXv/NETjZQhGadZ7r1lvd/mxwD9raKxMT/HC5fiL8vVzu
 6rpXXvnniqdo8T5T8nwrZ3qdnrvY2IS3dgEINyTNIkafpBWcJI9A0HkI1OLScA314GL/
 mxpsGO/jlQJPSNRBPWFkI1FPt7KVzapB+J//K/FNgP5We/q9wnHNDr7R4/zgVx2Kc5tM
 XLAJzYeWgxNypRcVq2VTOnifS7sJ0VjsQfIFRbS0ObGXHyJWBseVfcSW04g/tX3pOTA+
 zCEA==
X-Gm-Message-State: ANhLgQ1Pn+K5/oC3Al7IdAUQXgeYhUIN8nbNTFgGijsYUKaP/43TLXWK
 O2mku3TsQg33dRj4BrmLaWLkpPvl4/pylAMyzRw=
X-Google-Smtp-Source: ADFU+vsWKd46vZveHx9M2yXIoJCrlyRomGGVxfnkeiiNED12YbUeYIwfRcad6LGYY6pvVbHcPjOVn2a7A1TF1VLW0ro=
X-Received: by 2002:a37:4015:: with SMTP id n21mr6220237qka.76.1585466453876; 
 Sun, 29 Mar 2020 00:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAFVqi1R0Cc4+wqwCr9-8HoTU+6cShzorD44YzDNyex+jv1dztA@mail.gmail.com>
 <20200328195932.GA96482@google.com>
In-Reply-To: <20200328195932.GA96482@google.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Sun, 29 Mar 2020 01:20:42 -0600
Message-ID: <CAFVqi1Td3kE0Gd6S43F5xs3br=UBd1ssZu-1xkoO+Z9EYRQR=w@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Kelsey Skunberg <kelsey.skunberg@gmail.com>,
 rbilovol@cisco.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Don Dutile <ddutile@redhat.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bodong Wang <bodong@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] PCI: sysfs: Change bus_rescan
 and dev_rescan to rescan
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

On Sat, Mar 28, 2020 at 1:59 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Mar 26, 2020 at 12:29:11AM -0600, Kelsey wrote:
> > On Wed, Mar 25, 2020 at 4:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> > > Thanks for taking care of this!  Two questions:
> > >
> > > 1) You supplied permissions of 0220, but DEVICE_ATTR_WO()
> > > uses__ATTR_WO(), which uses 0200.  Shouldn't we keep 0200?
> > >
> >
> > Good catch. Before changing to DEVICE_ATTR_WO(), the permissions used
> > was (S_IWUSR | S_IWGRP), which would be 0220. This means the
> > permissions were mistakenly changed from 0220 to 0200 in the same
> > patch:
> >
> > commit 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> >
> > To verify DEVICE_ATTR_WO() is using __ATTR_WO() can be seen in
> > /include/linux/device.h
> > To verify permissions for __ATTR_WO() is 0200 can be seen in
> > /inlcude/linux/sysfs.h
> >
> > These attributes had permissions 0220 when first being introduced and
> > before the above mentioned patch, so I'm on the side to believe that
> > 0220 should be used.
>
> I'm not sure it was a mistake that 4e2b79436e4f changed from 0220 to
> 200 or not.  I'd say __ATTR_WO (0200) is the "standard" one, and we
> should have a special reason to use 0220.

Sounds good. I didn't find any information or reason stating the
permissions needed to be 0220. So sounds like 0200 will be the winner.

Appreciate the help and you checking this over!

- Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
