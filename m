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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46E9C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:40:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8885F2063A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXXPkK8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8885F2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C95286DCF;
	Wed, 29 Jan 2020 10:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUVDGG7srsE9; Wed, 29 Jan 2020 10:40:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C579686DCA;
	Wed, 29 Jan 2020 10:40:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFB58C0178;
	Wed, 29 Jan 2020 10:40:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 757B2C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6341420417
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgmjbYOIzYj6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:40:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C46C120361
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:40:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d9so6294056plo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 02:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzRHTQO3pKjBfSJ2Rfvh5FEUg0GL15o7FlclGpgfTy8=;
 b=mXXPkK8PdQ2HdiEfv6/GdfMm2GHaXIbrDmZE6DD7Ikgky9gFKICmwUhAGVv62RvaGo
 0LvGo8bD2iL13nEuUbdsCGON79b56e0+xUNbWjsihsxRNealZEf4eLifUd+FdnG8xFEU
 SUx8GApPVHqVlym8IjGEYT0dVck16glEdhbRyhfeJwqSh3dYI3gjRSXSV82Bz8SoG7Ul
 DySpydLaiVdTS18v9FYxMhuNkyshDxDQi6NsoB3JiXQ5ItbffCpELITTXwAYvXHZIkjm
 ydLKgbfsJa8Zgr11su/bnscBM7IAWC6hA2ewzu51NYnSJRK44W9xTqA+Tu20YUu5M12M
 x5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzRHTQO3pKjBfSJ2Rfvh5FEUg0GL15o7FlclGpgfTy8=;
 b=JqSBkFklpdPHRVZIl+3FYBbFhQgoCJQD8oQvi60ofP3HDCEJYEnST4m1Srh7UO3diL
 ymONkLF302VtzAQfLiHWa54NoL2MkZWnCR81wfAayAoSs8XKJ0Dytgcv/LNUisXfeqS+
 nCPK6Ldb4FmCxlSjMX1ySvgtnGSZuc7FVenaVRAiieyrs5w6jBRPgu4u/5VUDUYxkiTA
 1s+sGLcpheTn5VRE1o1IulhKJjY9xdB7l66SQp/JhvYd+ywhr6F+4/kIOTVg/bBOtsUP
 b43UnSbVuz2k+l9R/zGn+Y7l6u6wkVyYTt6ay4plVTZzgeQl0H+XLdMBbA3Ilz8Jli8F
 kRkQ==
X-Gm-Message-State: APjAAAV6/YAkM5FVOPAK8LO60vAZ6aH4ymH+GXRKHeUyzWfU3AaUq8JU
 zMAAgOHzqrs1y3z8ss/dZ6M=
X-Google-Smtp-Source: APXvYqwyd5UBrtC57QGpd9Ru9Ha2G15gvVk/UC14vHvGCkou957aoLuYoIipivd+xRp9PllidBEvXQ==
X-Received: by 2002:a17:90a:2545:: with SMTP id
 j63mr10615588pje.128.1580294447327; 
 Wed, 29 Jan 2020 02:40:47 -0800 (PST)
Received: from pragat-GL553VD ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.googlemail.com with ESMTPSA id h3sm2319678pfr.15.2020.01.29.02.40.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jan 2020 02:40:46 -0800 (PST)
Message-ID: <287916429826dd2f14d82f9b7b6b15a9cace2734.camel@gmail.com>
From: Pragat Pandya <pragat.pandya@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jan 2020 16:10:39 +0530
In-Reply-To: <20200127115741.GA1847@kadam>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
 <20200127101343.20415-10-pragat.pandya@gmail.com>
 <20200127115741.GA1847@kadam>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: devel@driverdev.osuosl.org, valdis.kletnieks@vt.edu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, 2020-01-27 at 14:57 +0300, Dan Carpenter wrote:
> On Mon, Jan 27, 2020 at 03:43:30PM +0530, Pragat Pandya wrote:
> > Change all the occurences of "Size" to "size" in exfat.
> > 
> > Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> > ---
> >  drivers/staging/exfat/exfat.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/exfat/exfat.h
> > b/drivers/staging/exfat/exfat.h
> > index 52f314d50b91..a228350acdb4 100644
> > --- a/drivers/staging/exfat/exfat.h
> > +++ b/drivers/staging/exfat/exfat.h
> > @@ -233,7 +233,7 @@ struct date_time_t {
> >  
> >  struct part_info_t {
> >  	u32      offset;    /* start sector number of the partition */
> > -	u32      Size;      /* in sectors */
> > +	u32      size;      /* in sectors */
> >  };
> 
> We just renamed all the struct members of this without changing any
> users.  Which suggests that this is unused and can be deleted.
> 
> regards,
> dan carpenter
> 
Can I just drop this commit from this patchset and do a separate patch
to remove the unused structure?

regards,
pragat pandya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
