Return-Path: <SRS0=NhIe=ZF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AE3C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Nov 2019 07:30:54 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B1421A49
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Nov 2019 07:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgQvW1rY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B1421A49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7115EE43;
	Wed, 13 Nov 2019 07:30:54 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7806DDE1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 13 Nov 2019 07:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 396EBCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 13 Nov 2019 07:30:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bb5so704290plb.4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 23:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=GnSXj7wbOxCwDVVSqPJHVgWQMahBnkDDsOVZqkoPHfw=;
	b=YgQvW1rYs43N9tt+FrafUjoLcqiOXKM3ivn01JzvOkrqRRDCGR4nKEBvfz+i3ABoAn
	EZHF6aQA29o4OeBz+csG0K/4VU24c3f14BM3gCKp9VkXwSzqWAo8tosSN2D6Q0+eKmWO
	eYonWlpWzeshvRJOiwnEe05jh3KNvxDS5j6b5F5+w78VT/BDv77IK/GH4UG88JLmdwN1
	s/KTVccPpLxZg2KTRpkgj5cabF579+EGODiOp6GdDmeyzH7DQIdQMy9tWHNw3qhTJ6v+
	mPPHHSQyMFxr4dz/GaiM3lGX8Xmk92hvpRLP31Dhw7NPfht/bz/e2o+0YiYYmpO6R9Ix
	QFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GnSXj7wbOxCwDVVSqPJHVgWQMahBnkDDsOVZqkoPHfw=;
	b=OkNxnCAra6JjWoUDOFtF5mKtht5jmFXCJt25wVnHDqhBvtli3l8GA6a4dKBKPeNMv4
	dJ9KwiLNXh6Z0w3etTUOoh3X94OMz/nSAUjs8D+E7abqv1+GY20hQuVKxVLEHRkR5wjU
	fPaZBNNAPRP/A0EjnIE1xga8Gg/uIaBS1WH1UbfR9F35G0XioHVAFNcHkm92Q5jHXzPH
	V0oimAOK1YSBVTSAhfxaR1nCbO8lCwP/EWyzXOrxEidGSLUWg8w9pIOmrGzqFxIGopoj
	AGED/MMv4u/Li0TRFHNoXbqINYo2A0EDaxWKdW7EzVUC0F5m6L3RVDu8tCtnVp1eTbAt
	uq7A==
X-Gm-Message-State: APjAAAU+/L4gtunks0LZv9Z0lNjymAk6vs7eXE09FOEF5XPL1GlGfacx
	+2BLUbatHF48SVe+n9TT7ILAX0wuO7Z1Ag==
X-Google-Smtp-Source: APXvYqyggFF3SArQPwr6oi9Nn5mVEY51JDuGeFs6A8hWrChD23Cxw98xuKIpAScywnA/KAr0bD5MCA==
X-Received: by 2002:a17:902:6ac9:: with SMTP id
	i9mr2261051plt.218.1573630243614; 
	Tue, 12 Nov 2019 23:30:43 -0800 (PST)
Received: from localhost.localdomain
	([2402:3a80:166c:698d:7a64:6a4b:9d08:b425])
	by smtp.gmail.com with ESMTPSA id
	q12sm2095770pgl.23.2019.11.12.23.30.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 23:30:43 -0800 (PST)
Message-ID: <97b1695ebcbd2dd5ce8c117af0232ad6a1fee20f.camel@gmail.com>
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 Nov 2019 13:00:36 +0530
In-Reply-To: <20191112100454.3b41f3af@lwn.net>
References: <20191105071846.GA28727@localhost.localdomain>
	<20191107120455.29a4c155@lwn.net>
	<cd9dbb3704d0a39a161c3e4df8fcd9f84bbc5b03.camel@gmail.com>
	<20191112100454.3b41f3af@lwn.net>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	willy@infradead.org, neilb@suse.com, tobin@kernel.org,
	stefanha@redhat.com, hofrat@osadl.org, mchehab+samsung@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	christian@brauner.io, jeffrey.t.kirsher@intel.com
Subject: Re: [Linux-kernel-mentees] [PATCH][RESEND] docs: filesystems:
 sysfs: convert sysfs.txt to reST
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Tue, 2019-11-12 at 10:04 -0700, Jonathan Corbet wrote:
> On Sat, 09 Nov 2019 18:36:16 +0530
> Jaskaran Singh <jaskaransingh7654321@gmail.com> wrote:
> 
> > > At a bare minimum, an effort like this needs to put a big
> > > flashing
> > > warning
> > > at the top of the file.  But it would be soooooo much better to
> > > actually
> > > update the content as well.
> > > 
> > > The best way to do that would be to annotate the source with
> > > proper
> > > kerneldoc comments, then pull them into the documentation rather
> > > than
> > > repeating the information here.  Is there any chance you might be
> > > up
> > > for
> > > taking on a task like this?
> > >   
> > 
> > Sure! I'll send the documentation patch(es) followed by a v2 for
> > this
> > patch.
> 
> Great.  As an alternative, if you like, redo the current patch with
> the
> other suggested fixes and a "this is obsolete" warning at the
> top.  Then,
> after the subsequent improvements land, that warning can eventually
> be
> removed again.
> 
> Thanks,
> 
> jon

Hopefully I can get the kernel-doc comments right. If not, I'll go with
the alternative :)

Cheers,
Jaskaran.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
