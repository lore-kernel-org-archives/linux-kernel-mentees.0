Return-Path: <SRS0=nhK0=5K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6745CC1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:24:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE1E20409
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Mar 2020 15:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="autKwVYx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE1E20409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0305E884CF;
	Wed, 25 Mar 2020 15:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCRnJuFtpI5S; Wed, 25 Mar 2020 15:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9976B884E9;
	Wed, 25 Mar 2020 15:24:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE5CC1D7C;
	Wed, 25 Mar 2020 15:24:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48A97C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 40975884CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAPHPG1Sk6bb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:24:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DFC968867E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 15:23:54 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z24so1221021qtu.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Mar 2020 08:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0JYEoigZWM1yeX7JgpaphNd8KXCrioPAqCpQizqggg=;
 b=autKwVYxtzoLq5oAA+Cci6u6EukRb+k57IlORCbtMZ0TIBF8bAkJ2aWzN09JD3jY4B
 uX9DgK8r+QQPBwITxqt2ZZQoKHUHqBCpkMmvWkA1z0abhtfF8M67nOJz4OuilrmgUScU
 BzGSp7by7/dT7FPbNXuVD9bCLxLI/X4tWQDdx1TCa5Z0iUHvBXBOgZUyNJdDnq+EUYZ6
 gElffKRGxJ2Y26EvL0manWdox2JU8feN/5NnARGCVJluMpYTXuK+jvm7QE3ttRoDbm+J
 RuEvKykfq0Cxxwjg/NKtL50Jtz4PHGJwcH3R8oaV0cyVZGnSagzyIaZks55v3jJK1X3K
 QIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0JYEoigZWM1yeX7JgpaphNd8KXCrioPAqCpQizqggg=;
 b=OKm0H3fm15fWeNjqCYjdw2BnVocNVFw9/niwFvADroNAq2qzoChOebBfFra3HG97jf
 9qqVji4cwgaf64tB6QdH2wnN57VuIo8ipC84QiF8GdQkviW0QPgYI+1XroT4YyGgv/9W
 LZz7FlRuLNmRS9hCw15Ey2YbJRxM0tyoZst6ef5xrLqeRY3Butj6Skjh421bxOM2P0jl
 swa6KNgBcpF5k2DEcyN+9Pp19W4b30UE23W4BYZa86bx3UUOvLQmyGtqQbGuyy8cu+Fq
 vdOsceP+OZbpI9VPgyFN7eJP4Ov1DitU7FDKZnAvvCZ9mwN1fzswZjpn7ZHyC54ZX0BU
 8AAw==
X-Gm-Message-State: ANhLgQ1R96/B5Vg4D01BDA1bp/0QgV4lXCT5ROgPVkzFyzp5ESK016v5
 4aVDsufm9QzHBzcKd7qMcV+UH0NHs9fh/rMseLM=
X-Google-Smtp-Source: ADFU+vtX1EZKWaDVmE6LIswsBe1CfdqTF6SPmg7IMajB6dCadIJAq80gEr8/yesNu0odN314yF5sUBfDtGnycyv+wqU=
X-Received: by 2002:ac8:38cc:: with SMTP id g12mr3541264qtc.186.1585149833875; 
 Wed, 25 Mar 2020 08:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200324234848.8299-1-skunberg.kelsey@gmail.com>
 <20200325071608.GA2978943@kroah.com>
In-Reply-To: <20200325071608.GA2978943@kroah.com>
From: Kelsey <skunberg.kelsey@gmail.com>
Date: Wed, 25 Mar 2020 09:23:42 -0600
Message-ID: <CAFVqi1R7gHCAMSKw5SSns0jq0++60vyoao6w_g_proC6dYD2_Q@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-pci@vger.kernel.org, rbilovol@cisco.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Don Dutile <ddutile@redhat.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bodong Wang <bodong@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] PCI: sysfs: Change bus_rescan
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

On Wed, Mar 25, 2020 at 1:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 24, 2020 at 05:48:48PM -0600, Kelsey Skunberg wrote:
> > From: Kelsey Skunberg <kelsey.skunberg@gmail.com>
> >
> > rename device attribute name arguments 'bus_rescan' and 'dev_rescan' to 'rescan'
> > to avoid breaking userspace applications.
> >
> > The attribute argument names were changed in the following commits:
> > 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> > 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
> >
> > Revert the names used for attributes back to the names used before the above
> > patches were applied. This also requires to change DEVICE_ATTR_WO() to
> > DEVICE_ATTR() and __ATTR().
> >
> > Note when using DEVICE_ATTR() the attribute is automatically named
> > dev_attr_<name>.attr. To avoid duplicated names between attributes, use
> > __ATTR() instead of DEVICE_ATTR() to a assign a custom attribute name for
> > dev_rescan.
> >
> > change bus_rescan_store() to dev_bus_rescan_store() to complete matching the
> > names used before the mentioned patches were applied.
> >
> > Signed-off-by: Kelsey Skunberg <kelsey.skunberg@gmail.com>
>
> You should add:
> Fixes: 8bdfa145f582 ("PCI: sysfs: Define device attributes with DEVICE_ATTR*()")
> Fixes: 4e2b79436e4f ("PCI: sysfs: Change DEVICE_ATTR() to DEVICE_ATTR_WO()")
>
> to this too, and a
>         Cc: stable <stable@vger.kernel.org>
> to the signed-off-by: area so that it gets properly backported.
>
> Other than that minor thing, looks good to me, thanks for fixing it so
> quickly:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Done! I appreciate the review and help, Greg. :)

link to v2:
https://lore.kernel.org/r/20200325151708.32612-1-skunberg.kelsey@gmail.com

- Kelsey
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
