Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA41552FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453528; cv=none; b=nKdHPLPjP1Svnxz87s1OHlSzyHqWTJXp8wScfVRTBZ0yhfpmBJBXyvWnBN2kF3tX9+aOwgiS2hYi9g+euwsUIBWnq40MgRRMS8Szu0uAAcAqnprPLqEB2zNRLvEluysOMajjpnZNVzY9l4o11ae+ncCFrtDDMJKMZSk/zBIODvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453528; c=relaxed/simple;
	bh=KJXr8v/OtPrbW9nPLGgNd7ySuI7MnDx84Zz8ZrsnQlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptLAX4idUxrmISrvRy+e0Oxlf3uaElDk8ByxOXNUzaIxFRbAAY91ralKtTgl35WO9Ws4s29SN3l/XluuMvWOQ1Bx4eiwjBoZC4CmljGVqeHxrymFybvgxqtDu5j6buUm5O0T4vLinZkzDtx1a2T8GuZD/9mazXm3OsuItfWK2AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tsp7V/um; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tsp7V/um"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50656068A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 19:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABagJq7kZBvx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 19:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A29B60674
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A29B60674
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tsp7V/um
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6A29B60674
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 19:18:45 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fee6435a34so41650835ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 12:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722453524; x=1723058324; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKmXPYGLiuooxOyOTiioTCzv35HEsS/Fq6QbtaZlhZ0=;
        b=Tsp7V/umr2CWvZ4iG5XThSS2wAxMrHSm6VJZGL0QX3PHncj+d/7zr9vD3+Tyq2JLXN
         8497qwH0q4NiGwZqGTFyrEp4lYpMCysfGQAOo/Mdbso/7lE/Pid0X/ibYCrDK/bHSj1+
         MzWiCallyJ6++OpTToOx8XfmzXDfTPjs1KhcpJyunsb1TOWYzya//owXYuQpq17xVGKB
         PtgehfIVUbACkdBdFTip3Itw9nyAzKaNxGyTOlXwgL+d8xDR+hm0mJlX7jekLJT7shCJ
         XzfsUjGsK1MxyE6QrZ7ql4Rdz/WWuP43rAA1nGrHyNITTGjxveQiTIoZUuo8qc62NGJX
         klFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722453524; x=1723058324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKmXPYGLiuooxOyOTiioTCzv35HEsS/Fq6QbtaZlhZ0=;
        b=YjIrgmSQ6Avl726etEE+r47QAnlD08x6Sy3/DPsFsACVEn8jFnILXg+gI2BsfNeJrr
         wHKibb3uUw14+1/Sc4gDsq3jq6McA0NK1ms4j9qFKo5HSHVrjBOs/ixnZwNewJBJR4eb
         gtmySHxys1pw/tlarDFMxv7MBDMaPf5mwyp9uW6UHAz8fCpMxeJ3OMD9oN1R/kbdYkdw
         czWoSOZSc/unQPwpsWT3D4J+0Idyq4iaX4b6g7ZglW5Wc60Mn819Au9A1ULQBrsl2qd9
         4jFGAnB3RIejapc1WT2qIbU/F2tRiDmEIZgM+pfpHnI8J16kc5A1HB6394cjznUwBPmn
         0DAw==
X-Forwarded-Encrypted: i=1; AJvYcCWlR0++uhfWv97oozN0DLQb2oXgy+6kOANW6cqBm1Bwk7ov72ortAxpFfhdKQfEHlQEn6zyNSr39DvtPBmYOiFjHCQpHha4uGR4FxUlKaeQrLvlyhDY3lDMBdb9ilDs
X-Gm-Message-State: AOJu0Yz8Pjny0CiOCxQ11+uvmTreYaI44TAA7wYZKgkPCjse0pq8CR5G
	w9F2vDZNw9UKnkeBdtZLZeP3PhRoKka4USqhCpik0BDsbfoRvz+8
X-Google-Smtp-Source: AGHT+IGtmnnl8w0OObeGNOiEbvgRRrT+3phJ2aRna86jFJDkcu5+xWDzRmjV52RpxJofqPq1X8hLSw==
X-Received: by 2002:a17:903:2349:b0:1fb:4f7f:3b59 with SMTP id d9443c01a7336-1ff4ce5792fmr3809585ad.3.1722453524371;
        Wed, 31 Jul 2024 12:18:44 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.205.109.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d37745sm124165475ad.112.2024.07.31.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:18:43 -0700 (PDT)
Date: Thu, 1 Aug 2024 00:48:33 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <ZqqOCYZ6TtXdXpea@embed-PC.myguest.virtualbox.org>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>

On Wed, Jul 31, 2024 at 02:19:54PM -0400, Alan Stern wrote:
> On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> > On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > > On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > > > Hi,
> > > > 
> > > > On 30.07.24 19:56, Abhishek Tamboli wrote:
> > > > > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> > > > 
> > > > > > 1. use a constant, where a constant is used
> > > > > I think you are suggesting that I should replace hard-coded values like the
> > > > > buffer size with named constants. For example:
> > > > > 
> > > > > #define BUF_SIZE 8
> > > > > unsigned char buf[BUF_SIZE];
> > > > 
> > > > Yes, but the constant we need to look at here is bl_len.
> > > > This is a variable needlessly.
> > > 
> > > The code in ms_scsi_read_capacity() is written that way to be consistent 
> > > with the sd_scsi_read_capacity() routine.  Or maybe it was just 
> > > copied-and-pasted, and then the variable's type was changed for no good 
> > > reason.
> > > 
> > > Replacing the variable with a constant won't make much difference.  The 
> > > compiler will realize that bl_len has a constant value and will generate 
> > > appropriate code anyway.  I think just changing the type is a fine fix.
> > > 
> > > > > > 2. use the macros for converting endianness
> > > > > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > > > > Should I replace all instances of manual bitwise shifts with these macros?
> > > > 
> > > > Yes.
> > > > 
> > > > > For example:
> > > > > 
> > > > >      u32 bl_len = 0x200;
> > > > >      buf[0] = cpu_to_le32(bl_num) >> 24;
> > > > >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > > > > 
> > > > > Is using cpu_to_le32 appropriate for the data format required by this
> > > > > device?
> > > > 
> > > > Well, the format is big endian. So, cpu_to_be32() will be required.
> > > 
> > > Better yet, use put_unaligned_be32().
> > Would you recommend submitting a follow-up patch to incorporate this change, or should I leave it as is for now.
> 
> You can submit another patch as a clean-up, if you want.  But as I said, 
> it isn't needed.
> 
> > >However, there's nothing really 
> > >wrong with the code as it stands. It doesn't need to be changed now.
> > As you mentioned there's no need to change the code, So my initial patch is okay as is?
> 
> It is as far as I'm concerned.  Obviously Oliver has a different 
> opinion.  But I'm the Maintainer of the usb-storage driver, so my 
> opinion counts for more than his does, in this case.  :-)
Thank you for your clarification and support. I appreciate your feedback.
I'm glad to know that my initial patch is acceptable to you.

Thanks & Regards
Abhishek Tamboli
