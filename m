Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28664C33CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:58:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F422064C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0UpekPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0F422064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E0BD88075;
	Wed, 29 Jan 2020 10:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mW2wuxTLYCju; Wed, 29 Jan 2020 10:58:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6073287E78;
	Wed, 29 Jan 2020 10:58:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57B58C0178;
	Wed, 29 Jan 2020 10:58:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AC48C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 398BC86DDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1WL0BV3QvRA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:58:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EC54A86DCA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:58:45 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y5so5174020pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 02:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DnkKDo9E340IryD18Mp59JG+Dgi6azYeZD8jX7vqjKk=;
 b=h0UpekPFyzxi+v1iRWR5YC2RvbXSeusjVTn7wf/YaVrrybMkP8jgwBIRDMsmEUe9kk
 RRDUGeYBXoOz/BeWYSBwkgkM5N/Ly2zZxXca5gZASIy9hnC0Dy2gbzg4MZ+XSs2P+RaK
 jhUXL3VpHSnpsBrDYauaxbzq9HxJTGylyWQRm8AZ0ew5wVONgG+e87t8kw7PoxPfVYYQ
 u2B3PVH0mejnI7yJ+FYFEQRJNRS9gczuf4FtQV3X2WN2P+qUE9lvf1dU5Us9UWHUr3bP
 L+Jt0n98Fz+Wky1b/3ule6nHDWXXM+YmMNG88IlCwffRA+rMTY0hitEm+m59qiA4p2A1
 KlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnkKDo9E340IryD18Mp59JG+Dgi6azYeZD8jX7vqjKk=;
 b=p1gsPo8AsJ12EwXN+Z3rdl/ZkGWtmkx3dN3uFmo1Qi+PGxN1TsERTSbiqLlQjKNF6C
 GEsa6abM1e7rPnvjvp0Hlhz5fiUamFk7/QprQmYqI4okK9qcTXGQ/HbH7AtqOkdsxjC6
 U/VAgRSYjF3VrppLaII9f8ett6X/0MNXE+QEdkHyZq96OcwyRyGocP6jSzYtrI4anNMH
 2M5cKu8DbzxoaLr76mQ/8+M9NPJP1BDqwnnVOWhCIPSOigwvWgmuJ8zQEVrVDa/tEkup
 1Qx3FKpdvT9/VAV74Kpn5HUkNKYxct8uG9ua/fHiOveYhc7ClxCR3UpYowtydKl4lcO9
 xhdQ==
X-Gm-Message-State: APjAAAXX872uLybWmZYxpRCoTpRiZwoa1qfHkEVPatBjKav+xOWlmRNk
 FZgSY260FS+lAznzGlmzqf8=
X-Google-Smtp-Source: APXvYqzZIzh+PS0Ileykyhf/P+2UFPNgdQpMZqkFXaJKSAhkm311VSj7Fq+pMup+H+KY4PzIzZsfww==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr8768170pfc.195.1580295525577; 
 Wed, 29 Jan 2020 02:58:45 -0800 (PST)
Received: from pragat-GL553VD ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.googlemail.com with ESMTPSA id y75sm2384448pfb.116.2020.01.29.02.58.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jan 2020 02:58:44 -0800 (PST)
Message-ID: <0eac2eebe812a42fd447edfeff3d2791276b655a.camel@gmail.com>
From: Pragat Pandya <pragat.pandya@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 29 Jan 2020 16:28:37 +0530
In-Reply-To: <20200129105012.GA3884393@kroah.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
 <20200127101343.20415-10-pragat.pandya@gmail.com>
 <20200127115741.GA1847@kadam>
 <287916429826dd2f14d82f9b7b6b15a9cace2734.camel@gmail.com>
 <20200129105012.GA3884393@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: devel@driverdev.osuosl.org, valdis.kletnieks@vt.edu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 09/22] staging: exfat: Rename
	variable "Size" to "size"
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

On Wed, 2020-01-29 at 11:50 +0100, Greg KH wrote:
> On Wed, Jan 29, 2020 at 04:10:39PM +0530, Pragat Pandya wrote:
> > On Mon, 2020-01-27 at 14:57 +0300, Dan Carpenter wrote:
> > > On Mon, Jan 27, 2020 at 03:43:30PM +0530, Pragat Pandya wrote:
> > > > Change all the occurences of "Size" to "size" in exfat.
> > > > 
> > > > Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> > > > ---
> > > >  drivers/staging/exfat/exfat.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/exfat/exfat.h
> > > > b/drivers/staging/exfat/exfat.h
> > > > index 52f314d50b91..a228350acdb4 100644
> > > > --- a/drivers/staging/exfat/exfat.h
> > > > +++ b/drivers/staging/exfat/exfat.h
> > > > @@ -233,7 +233,7 @@ struct date_time_t {
> > > >  
> > > >  struct part_info_t {
> > > >  	u32      offset;    /* start sector number of the
> > > > partition */
> > > > -	u32      Size;      /* in sectors */
> > > > +	u32      size;      /* in sectors */
> > > >  };
> > > 
> > > We just renamed all the struct members of this without changing
> > > any
> > > users.  Which suggests that this is unused and can be deleted.
> > > 
> > > regards,
> > > dan carpenter
> > > 
> > 
> > Can I just drop this commit from this patchset and do a separate
> > patch
> > to remove the unused structure?
> 
> Drop this one, and the other ones that touch this structure, and do a
> separate patch.  This series needs fixing up anyway, I can't take it
> as-is.
> 
> thanks,
> 
> greg k-h

Ok, will do that.

Regards,
pragat pandya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
