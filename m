Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745411A23BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248439; cv=none; b=Gd3AtrGC+U5zh8fKf/xq4SELlieuCi6si7YnnGviES/m/4JicyYiBbl+iuJB7hX4Sog2yTP0C93FSZTa5V9sdVm8WmB0A3Islxa2U401HrlpKnV2UQlwvIoXC8AfLPSjOi8Iwbge32fQp5PlX62Kx/rDabIU/1g2jiwhsn98qyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248439; c=relaxed/simple;
	bh=NgpQKY7oOKJP61VlZ5CJRdiLpPJg2BT/Aj9U9AuZutY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE4QdS1AuOypU/xSwTxr59E16+9c6WeyChVAIikYBVnfSeeXFah9hujgWN9LKWEvg8lrOA5wyn5u29aWqf8uNc2yZgrmIp8GxNlCGH9WwWmDSErkTLaxixCFy9ZsupmREVWNUcE4Hu7bsxJe4GLtRGVM/l8vJjIPQkXaz3Q/fB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgjV+i/Y; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgjV+i/Y"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EC860E9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 04:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KmzWuCdVjPlt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 04:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D59360E98
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D59360E98
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hgjV+i/Y
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7D59360E98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 04:33:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f50895565so54808415ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 20:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739248437; x=1739853237; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TO7TOi6Qj15AoVYfQyS7G94i3nw+FMQ4O112jMp/9WA=;
        b=hgjV+i/Yy2dH93etgYZmy/Zm3BPvCkQ3Kg0xLmGNbmIJbQEymQfpfu5vx2Oc8RQn6W
         2WlINE5tviuzw+DJZGt59EctgrSvwVPJttnoAbGUSvNly7Tixj9WsM8YuZoUYTLC4KKt
         IKaI6wGkfYdvtRksOIH//ARB7zRDYnW0Eu06QBZExbUfChMHZLvhCMoCkFj4XI2N6PEQ
         cbm0gwjXBq0Q/2DNX8SKfv5m0afGsK8+RvlR+gdTrLVO1FhyAaPqC5NdMs2T3/OKMPGD
         LmDXB9URML+boRuHQxX3g48QS7BInokndNummCqu5qocOtEzKXrAUAdN/uDAn4I8Yu3G
         cv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248437; x=1739853237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TO7TOi6Qj15AoVYfQyS7G94i3nw+FMQ4O112jMp/9WA=;
        b=AxxwBaQzJkX6pRSF0KT6Cec3hZKUPeVe89OdB3AsUbM63WHHSOBoTMCzn9E6GXp/X7
         lBr+4m8S+M7O2a6wEHeDaFxCpZVRo/9BXw8nJ8yUyBCMLKOzTIEw3o5fRewwq2cm+qRr
         vj8VsRnZqwCwXqnepBbpt/3ZlCJQ4oanHS/tZklV4StBeNMg23cAdRbTFROqra35aD0q
         CbTWBWIkmjV/T9C+H1dhlrfFjjYgRHU36iEId5DQcTRN6jmibK/qwr9aY58YRGMF/Nr1
         L7LZQmrqCv6s8ecYab+fQHf5LBpy5qsqTJPp+FtIfB8F/GqgSCYRlZ4lL6BqqK/B1eDj
         83Og==
X-Forwarded-Encrypted: i=1; AJvYcCX/S5FqVurR65XKd9jy4smKNqw7ZXhleWeHKLqYgw48HPHJcd4SPwMBbq1tS6vogCqLr0M7/2ULySwJ391rEhi2djIIsg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzWfmkN+mZLyRgK6CMXHhsjkHer7EqMy5jty9bp0cY/6/y6UAGD
	UwFAfPt7PuTnT+U+Xw2mwFc7NCQZDMEWxn7D2IudBp2iCykbK/Le
X-Gm-Gg: ASbGncss0li8kNuvhkMFTAUfW/PiysVNrWqCMz1I8xl4sY3SMNL9ZP2PUH9Q6g6BQcK
	mgaCoM+bANFve8Yk8dZZ+/EMOP9DIVUBRZRbD8ILVYMRd224LBKFhZTZ6+UOcihfFVHmLA+72fp
	97/RSbAtVmW4LxUqx/BvqSaDSdbuC9+HMvn8Puyf9V3nGKmB5l2SEuzittvPY+wDWXvTXHT1QWX
	bbyHK0gQoRtp5gKY08PB7idUEvzzRsULiMH+5KBdNNAnd8VzuTKwZ04vQ7SlCzSJbTYHooFhjOz
	ias5LXqp3KxR85ISemi7dWHbE335a68ciMH0Bg==
X-Google-Smtp-Source: AGHT+IEU0EugEek1MNnCP+nh7b+EkxoJKeoAeRtNm4c1M7aB8JLXEN5cWb82GCvpWB9CB60yHfSGZQ==
X-Received: by 2002:a17:902:cec2:b0:21f:53a5:19de with SMTP id d9443c01a7336-21fb6443598mr29260475ad.25.1739248436713;
        Mon, 10 Feb 2025 20:33:56 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:4de7:cabf:f8dc:899d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa511510d2sm5404290a91.18.2025.02.10.20.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:33:55 -0800 (PST)
Message-ID: <67aad333.170a0220.17df76.7e76@mx.google.com>
X-Google-Original-Message-ID: <Z6rTLiA12j781NGw@ritvikfoss@gmail.com>
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 5F70014017A; Tue, 11 Feb 2025 04:33:50 +0000 (UTC)
Date: Tue, 11 Feb 2025 04:33:50 +0000
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
 <87frkl1ylc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frkl1ylc.fsf@trenco.lwn.net>

Next time onwards, I'll make sure to: 
- include changelog in commit message, nothing else.
- send patches via maintainer's tree rather than applying directly.

Really appreciate you pulling docs-next forward to -rc2.
I’ll be more careful!

Thank you for the guidance :)
