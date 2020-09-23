Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F087C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:33:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB17206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guhvDUgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB17206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C86822000D;
	Wed, 23 Sep 2020 14:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N+clT7tD8RvW; Wed, 23 Sep 2020 14:33:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5D4D720002;
	Wed, 23 Sep 2020 14:33:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EFB8C0859;
	Wed, 23 Sep 2020 14:33:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560EBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 418B98733A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s76Jl7m0EAIz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:32:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4AD2287329
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:32:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o5so211213wrn.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGRsimobAk7x9LK53KoArxzuwgLweU0zv4O8HtxU3QU=;
 b=guhvDUgj7+1dXFzvcpFXADDm35dNnDDQkjJHeoeSzaJ5Jk49QzA0LbQ1uUJMRmIqwc
 l2SUPj2ZQoOdMOS5hGsHo4H1knkD5sIYGO/VRiaxyRC2jHZ/zKDU9gN47kYPszK4MNXD
 zvlKfcAjx8BA0+uvZ0StohuB9f8/NbMirKXB/FBEKrIedceDhM5wH7n9/x80ybGTlIor
 e2m0YG91VSiSjJZNGHO+kHRObIXqJ+Qh9eSEND15zhZMs6dGyFJyh0CDq0NUC7TA+AAu
 8q0oUJIMwgEcEfPf2rQZNOOH3FzqfBm6iZxLzX5h9hNAQBrvgeK2iHank5P0LsFNSoLD
 vkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGRsimobAk7x9LK53KoArxzuwgLweU0zv4O8HtxU3QU=;
 b=X+FFWq4F4fzIiBe8hoU3smVnFUgrBvQl8i24EAX3JjG+h5XRVcSs1O/BmuMSTwBpKa
 Q5lQ4/0zaSU29HhgWU3d4kb1TgkSoKJBVs9JE1BP1KMhULU+QXya+HfXgFBb9Cgl7aoE
 4eYpyqX9hKq4fx+bBTcdTtQIczJ8Th2ZVSJdgFPeV3x6tFhqAmAluDeBV+Y09q3Dp3p+
 d7MyrBthilRbu32LIOntRkp/zpVmyok7AIZ5N1Tbk9q4ceCrjgjBu8zQitjgyxTmGV+/
 M7VeoGDpLyUdPe4PkXjC+QQbxrWafT8gS2sMsVackv/5bamdpjLlsHWusAjmsrZz2YFe
 xYdA==
X-Gm-Message-State: AOAM533ZITJCdGgAvAsIQRyouVcTpl478ZC0YJLcMkMIehftBStuxEHt
 +SoArF59xvwQYwphFIO2P+q+t11lpKAi9IpZSPI=
X-Google-Smtp-Source: ABdhPJw3bJWXUQEbxcOWG3BwMQnvs4bzdMoNz2+ECyQzSG2TYRvZiHkcRHjLhdvWlUL3SNf4cg5/E1g2Ls1K+PiJxik=
X-Received: by 2002:adf:9b8b:: with SMTP id d11mr1269065wrc.71.1600871577757; 
 Wed, 23 Sep 2020 07:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
 <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
 <1600870858.25088.1.camel@suse.com>
In-Reply-To: <1600870858.25088.1.camel@suse.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Wed, 23 Sep 2020 20:02:45 +0530
Message-ID: <CAOY-YVkciMUgtS7USbBh_Uy_=fVWwMMDeHv=Ub_H3GaY0FKZyQ@mail.gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: petkan@nucleusys.com, pankaj.laxminarayan.bharadiya@intel.com,
 USB list <linux-usb@vger.kernel.org>, yuehaibing@huawei.com,
 LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
	usb_control_msg_recv() and usb_control_msg_send()
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

On Wed, Sep 23, 2020 at 7:51 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 23.09.2020, 19:36 +0530 schrieb Himadri Pandya:
> > On Wed, Sep 23, 2020 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:
>
> > > GFP_NOIO is used here for a reason. You need to use this helper
> > > while in contexts of error recovery and runtime PM.
> > >
> >
> > Understood. Apologies for proposing such a stupid change.
>
> Hi,
>
> sorry if you concluded that the patch was stupid. That was not my
> intent. It was the best the API allowed for. If an API makes it
> easy to make a mistake, the problem is with the API, not the developer.
>
>         Regards
>                 Oliver
>

I meant that it was stupid to change it without properly understanding
the significance of GFP_NOIO in this context.

So now, do we re-write the wrapper functions with flag passed as a parameter?

Regards,
Himadri
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
