Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22561805E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 01:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235944; cv=none; b=a3YNO2pji2wo1RsgfjfwSc78UVJqFwNZckrrHgtosIyKk4sIvR6NJXqmaSs1ZPeSDjMgtZEuoUnb3lpj59NBHZbmzY/3pQmLiwYaCgAPUIO201r7rSpVEzmb/XQf090n3b0vyMIKAJ0iRHiLj2smTsQHXUMUnVi4TYhm8LAMr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235944; c=relaxed/simple;
	bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHZKqfOfZczvEVJbfsnEHRTBOPGSHxJK1AVaKe9XtPaZ8G64KIdV9Ghaskl2jsR/Ns5V+NM1dtO67uiGholaJ/4R3YVyZDgVLw0nAKTG2p57uT1VncDMRRgPcMjT6f/UUcCSpe9kDucJZN+1FNU8aLkynr8cWAneDDTmkKixMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMm21LeM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMm21LeM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71167408BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 01:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zALZ6oprdSEC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 01:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAD04408E7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD04408E7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XMm21LeM
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DAD04408E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 01:05:39 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f2339dcfdso78970725ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 17:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739235939; x=1739840739; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
        b=XMm21LeMKk4d7E7X1Ryrt9V5u0UdUjxhLEOxITXKgq0vzy+XmkNTUXCJiW0qTj4/FO
         9Dx5fA2dvzhPj/7H6oQDWBC+IGmPduia3MaR/GusAtrYGrkvtals2W8hiepVBBTMR0C9
         wf+72NiVbiJ+2LSKFEKSXjFPwRSOQhAwMar/Xpdt3cptxPfx/d80yuyzOgKrlav9C6xH
         oOV772zG65VS1vEcG151pZhSXJddC/8DqMbAxa50tUQ8hahhaRt0Hed4z0x2QZYsiSrz
         s73BgrwBC03rks7k22hvjSXLj7yxj0ZSEU3Xh5LzZZS1/iIk9msP740a/qocecQbJ5ne
         yXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739235939; x=1739840739;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1S94ucNOBdzRSEy0I1Bna4AyA2fVzt9h5ZEAHDCmAc=;
        b=tWo0FJnkm5EED+ABh9SrkjPRM9eGXZ5m6QKD2Im1y6WLb6WcsaoqQjT9h3EPkYe2nB
         FA8mE+K3t5U08/8h/GoHqMfKQwQaiYfec/vRAozML5cf6M/9aDLHXj+aKKPgaonJ3iXL
         v8TYL8eWSnFGeTaOxAEBJDq3EBvc59UOVYz5OlL+aLFXWzi2PcK65GcboIHRT4PKBMOG
         +BKNopwIujBEhDNCeVKvuIqyzPgRJdqIoPDa+SbzGZTIZ1BjQ41NFTNdjAkeB7ueS7sO
         8aU75kfWZcVsHyl+RMLInoDh4+1hUBLpnofSvIMY0OBAEXpPjwTeLw2xPmSEqNZX1vul
         NfLA==
X-Forwarded-Encrypted: i=1; AJvYcCWe0MHfE5EIkSLQyigQvSte/kWYFoJ4TQaluh3pkr0OTvRvNOGaMLHfUJcXygquMojvFjOQRrukp2hA1bOrF2Oc4bqzUQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwmWysuTZikSqAQOGPT9UtJG2pOkt8/noY4qVEWrGKhJJIP8+Ve
	7eHuGIR8uTbB77HJ5lUF/Cke8zFbanqMQdi7VQMStms4fscRYRif
X-Gm-Gg: ASbGncs3ijH2E+ZJH8piYEuul+YgHHEiYEPZfSu76IGy41SLpT+xe+381HK6OTF0MW+
	/xhzpMYpbrWAeexcoUBGGUH+pfO8/NK2Loa6FkAnc57tmz+AS+sGr8QzeQn7KpMi9oCirDK8lCC
	JXfg+1OzMAmOfRhc+rrO0Nj3EOKKNvV0Ud3p3hZz4WcOdyc05nLW7Qt5+8Y0wq2PCcpMpo9KoCs
	004+L7wamQvfUjepGDQvQrrnc2Gif8H1c4w2jqk3NR8ybhWfZcCXwpgsAD1TPLq22oHNVkB7neo
	5AJ/Aehhvs+6CBuYFlRnSC1XBPtIUlKgRCBT0g==
X-Google-Smtp-Source: AGHT+IHJ/h/Y49IPFE58NmIGxSLh7AOjZcv2Y9KOJnXJ0k/NdXO60kMLerCmrf3U0IoieowAOS1Ntw==
X-Received: by 2002:a17:902:d54c:b0:215:758c:52e8 with SMTP id d9443c01a7336-21fb6efda39mr25000615ad.12.1739235939090;
        Mon, 10 Feb 2025 17:05:39 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368cd38esm84154585ad.240.2025.02.10.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 17:05:38 -0800 (PST)
Message-ID: <67aaa262.170a0220.278074.3ec4@mx.google.com>
X-Google-Original-Message-ID: <Z6qiWESFExT2ZwS6@ritvikfoss@gmail.com>
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id A6A4D140124; Tue, 11 Feb 2025 01:05:28 +0000 (UTC)
Date: Tue, 11 Feb 2025 01:05:28 +0000
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
 <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>

Thank you for guidance!
I'll make sure to not include anything other than changelog in commit message.
