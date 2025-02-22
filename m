Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E601FF605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216652; cv=none; b=h8xMxVv1jzVJdoh/91JEnogA/5kq2TPnVT70/VakJREg20jPYAM/hzgbZXjHrtiJPun1VtI9LH6FIVIyEOLIG0+FzLo4+w1or/z1VxVbyefOysJoMCyHD8yKJG1Fa2vzDst9HoxB0z3DiUDZ+RnABYbFLCDLJKM6tPodfZFpHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216652; c=relaxed/simple;
	bh=hXAr6oIEi+/PIbCR5b0ihPtXixUgLNht0f3STJblDVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um2vjKqAj10emgqhqK5b0Nvo/tjAx6ykhaENK3Xwb+AaaEwy0l76iEXpZkZYh9hRegbCJ9bsOjZbnLJKsr4HpMuP2mMuHd/AM/9nzIyr4tysCqq3/3KQziDT5mMp4xpPhxJstdVInNzgv0JgM7FvFOOYfdmOdjyvGG1Ayfh+7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5VGBcno; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5VGBcno"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8998D4040D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 09:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMILykB16w4b for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Feb 2025 09:30:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D84D14024E
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D84D14024E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h5VGBcno
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D84D14024E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 09:30:49 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-221050f3f00so65688725ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 22 Feb 2025 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216649; x=1740821449; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXAr6oIEi+/PIbCR5b0ihPtXixUgLNht0f3STJblDVk=;
        b=h5VGBcno+Mr/RIYgHXrgRrnEfyJcIxulEuoW1hW+TB9ytna9+0o2jYfeMJBagMb4ht
         ArKypJB109HcUPqxekB0iOtvMwxq7S5BimgbZJacrzHxhGv4W2l9R3bdw9AgHQjiKDSp
         H9/nOXvRRjsWAUd8x4VnwMg0qS+OfYS5d/finlUvsRNtHsnXdwi0kDmphkXvwcKMNQDr
         xOdEHZIymTuBuLl0fP2LFvDUX1DTxKpPrjh1UPSlrQCQdnfklr5+hcRONIHwVMrJaESH
         iyUMdaOjvWM4vcI19vZYNDcF9WtK08ZbYwxiQhWuZW2mqAjtiqmv1GzQdZrVpv1TzuP6
         /4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216649; x=1740821449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXAr6oIEi+/PIbCR5b0ihPtXixUgLNht0f3STJblDVk=;
        b=Fw2IBzRB+I2F5E+uHMWN7L+TdyrNlg4LqHKCzB2Sn7mecjHngonVP4aLRlGAWLi+c5
         MAIipRa55Jvr+/X5c6XRG4ch26RUPEYc1uDOauWdaNz2zGb1ZcQM7evRfeFUa/GBWa8Q
         prujqjxb/cRGQ+DcEtnslo4/CxktD/AVuBjcZeeWS2dI20lOZU6nHnjbAEgluBb2jYhd
         TbyKg1Aaz8BO9CXbitvxD7XnPT5ULoiD2+LPngkAfIVlC+kg/QXMyaO9q8xRse5Q+itM
         z/cnsUQMlsrvS5QangnjoOUd1/N25AGJJFpTR83/+FwLUycXw1v/U1aEHBLz8I84bK/V
         wKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3sNfB8wYzBSonhQX+hdpIu8y1+cUnYXnrBAj0sQq1mBqw93ocAZVdniiCEMSfYjzlrC0IoTqstF7rN4H+uzmhaQFfqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzsM7rIxudFNeMRFFfopvYM4q6e5MgQhFi1JkVJBBGNDD2c8n/i
	WsGPAN6xhOZKfOMtL1LLsBx1B83A81kdqOwGP94S3Cb802L7pJ9T
X-Gm-Gg: ASbGncsD5xtoDusMrSQ9luWicrM49Q++o1TNwcuXPVp9O61rVtqjNBw51vmtBeMB9ew
	xcYyzRtjZtuAkcZEXv9RZ7Tunczuht4K1xaCLfERQAuA4Lux867FtaDY2w6B6sOg0mFPOo3i8sT
	5i+Qd+ENSKV8bEL96ypPb67VR/cimLeXytFy0Ij1VnXUcsppD6PuxfbyMv+9gStOB/hV/NLgjO1
	fSQfgYD+Hs/aT/hMyn7lVyNHdfS6AczVVGeDQacWUpBTdOl2YN3AXg7ZYF6h1mJ8tP5Gd6mcAda
	bvmFBVdgUgaRKhbEvJIwERyVA2iCWx+wNHzALEs0epv79Hek
X-Google-Smtp-Source: AGHT+IHdUVu20s80g9zpUNttiyeCSlx4ll29y5Rr7CdK3ZqQIPl/f/zJ6Puh0U3kaJqAewMl+0S1jQ==
X-Received: by 2002:a17:903:178b:b0:21f:140e:2929 with SMTP id d9443c01a7336-2219ff4e2f6mr101409025ad.15.1740216649065;
        Sat, 22 Feb 2025 01:30:49 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fcb8351600sm4025373a91.0.2025.02.22.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:30:48 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 55655ED9143; Sat, 22 Feb 2025 15:00:44 +0530 (IST)
Date: Sat, 22 Feb 2025 15:00:44 +0530
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/mount: Explicitly define buffer size
Message-ID: <Z7mZRO0eCwRU2JhG@ritvikos>
References: <20250222081711.48208-1-ritvikfoss@gmail.com>
 <2025022257-easter-shower-61df@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022257-easter-shower-61df@gregkh>

Got it :)
Thanks for reviewing!
Regards Ritvik
