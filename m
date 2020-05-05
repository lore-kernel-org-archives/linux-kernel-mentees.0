Return-Path: <SRS0=VpGr=6T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504B2C47258
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 May 2020 22:44:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5582073B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 May 2020 22:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="oiObcX6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5582073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B429888603;
	Tue,  5 May 2020 22:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhVjWebJlCa6; Tue,  5 May 2020 22:44:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED29E88602;
	Tue,  5 May 2020 22:44:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4BD9C088B;
	Tue,  5 May 2020 22:44:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16CACC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 22:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E7081204CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 22:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21aqr3b9D9DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 22:44:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 564D920440
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 22:44:07 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id di6so1911913qvb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 May 2020 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=C76LIzi+5JEntbZy/qpJ0FbBUCkVF2NVl+l3fJXGdsQ=;
 b=oiObcX6jBSeqxuVh18DxaP4VKpyAStp5GGdizA7cYt7WmM6dWbuGQxBEL+VVoIUoDS
 ku8zmELuSS6v2qq/ewa5IGUmKfU1iJyBxNXu5tieOc9Fg7O/h6ARn4CbxdSx3sngwN7P
 EEXC+owDs1Gi0O0EncsKBljKwVT4X2TuPXsU1rFQgyxcqNF9LjhT02wYkxMfR8aUXww7
 p6+++CupbZ6LKHySeJgjAwRgwXZbB1Kin250GH4Raw+JGTZMtxqoUDIWW18Zst6JPlnq
 xpCTHnxhduEM9lWP+uY1GPfZ458TP3yzoWOnG3LUPTIbN+CX5FTJVLp25HD2Jh/Ebus7
 KYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=C76LIzi+5JEntbZy/qpJ0FbBUCkVF2NVl+l3fJXGdsQ=;
 b=U/p/0kwKJ42+za8p89xgczT2KGRyYWhgVtdg2gs8kiqWQw+Y0PMOwov1I81RTcI9Jv
 3O0DdZifV9u5E6pUUMC8yue4ihU60M4Il7UaYhmqu/c5/0gvH0IU5i5fcp4XhgR7962C
 TpX4wDVllr+dGKp1WyNr4SuPPkhxs32tQlheB9uicJ45jbFmd9lbgDC/G4/VNG4As/FQ
 Z9JuZK3r7471zVWA4HGkLHwRsHBSyR4/I90+1F3//Namhodmzh2J9UGlop7ZEgMEr+vA
 GftZtCQOo8RU6ykPMc3FqQL7pmvVgAhmTwmQ2oXCLaOWWMhEdIRRqsC+GJTnPEPbuEOh
 6K4g==
X-Gm-Message-State: AGi0PuZy3mI0+9n1LQC3zG866CszHcDIrjh+QeWxGNFEoQHn95fmWeBN
 MXiihbuJNv9p80583QRlVLj+oA==
X-Google-Smtp-Source: APiQypLneX5+0+lcyzB0u8ws0ZzKSXPK5claKysblIbIb96NIdVrq1gVior7r/FubUDA45y7URkDvw==
X-Received: by 2002:ad4:55a5:: with SMTP id f5mr5000177qvx.133.1588718646066; 
 Tue, 05 May 2020 15:44:06 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id u11sm3058126qtj.10.2020.05.05.15.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 15:44:05 -0700 (PDT)
Message-ID: <c092c2f7659d344744bd4400bccc2bb6f774b998.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 05 May 2020 19:44:01 -0300
In-Reply-To: <20200505094632.0d34f72b@lwn.net>
References: <20200430221238.101838-1-vitor@massaru.org>
 <20200505094632.0d34f72b@lwn.net>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: akrowiak@linux.ibm.com, pmorel@linux.ibm.com, gor@linux.ibm.com,
 linux-doc@vger.kernel.org, brendanhiggins@google.com,
 heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: s390: Fix wrong label
	Guest2 instead of Guest3
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

On Tue, 2020-05-05 at 09:46 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 19:12:38 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > This fixes:
> > 
> > Documentation/s390/vfio-ap.rst:488: WARNING: duplicate label
> > s390/vfio-ap:guest2, other instance in
> > /home/iha/sdb/opensource/lkmp/linux_doc/Documentation/s390/vfio-
> > ap.rst
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/s390/vfio-ap.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/s390/vfio-ap.rst
> > b/Documentation/s390/vfio-ap.rst
> > index b5c51f7c748d..367e27ec3c50 100644
> > --- a/Documentation/s390/vfio-ap.rst
> > +++ b/Documentation/s390/vfio-ap.rst
> > @@ -484,7 +484,7 @@ CARD.DOMAIN TYPE  MODE
> >  05.00ff     CEX5A Accelerator
> >  =========== ===== ============
> >  
> > -Guest2
> > +Guest3
> >  ------
> >  =========== ===== ============
> >  CARD.DOMAIN TYPE  MODE
> 
> Applied, thanks.
> 
> Note, though, that while the patch does "fix" the warning, what it
> really
> fixes is (as suggested in the subject) an incorrect heading; the
> warning
> was just a symptom.

Thanks Jon, I will be careful about that.
> 
> jon

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
