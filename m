Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27C2E0B60
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891494; cv=none; b=mTnzMEpGOzsPSUKLp1tHcpEKiC8Vthj2xFYLHnuxWaNfNBNbo9AoeSA7PKB9jcgW8/VmlSK2JMgTxOxvlgqR7sU4pm6ddrMiO/c2US0HcN7sZZLteRzuKU6jtnXavejEpVXjhsEhlSkJjnuZbsgCCsp6efb2b4yZlNVy79CLfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891494; c=relaxed/simple;
	bh=9aoozeymCtilt+qkHUzPEFhKKMah5TAuvXJod7umpVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpNy6NpQSjUB355tgboZVDCqO3+9Kodg5b0XY1PZvRWvJsqGM0p74i5oDH2wfUuMEQRd1to9UAcjmoA8/3h12ht/qCd0tE9vgm8TZHkhpOjTHRzbPueyoBaRurEAaekfbG4hmDUot/ePEiHLjlUrJk3ClfFYW+gZZ/3nPmX/FGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnqZr3Jn; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnqZr3Jn"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-76c144b06fdso12039757b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758891492; x=1759496292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+s3+W287EF3WpdqRLN76J6wag+8qKpJsyHBGGlUi1g=;
        b=KnqZr3Jnn8MrA6FG6mZ6z2z/p37e2SpE33i8gaRFpq5zzXB1TrhvVNVZslddMNGJau
         UTq93QqrHJxrU56J6j6qy1jwRuOSmeaXv/EncMn5USqrel034GxhbFNy6CNIaHMHk+PM
         bXOZXXq0tnFjHJneKpwzk7RszoL/pVi/RYpSADBdDJ0nEcUd9Zy7psje31jIBMf9YF0s
         03QPCVrXZb2IlTIT4G8IuTH7FoU7SE/YwnCsrS1Ww2JwTayA3ouc+qlNRQVZ6yNJRa63
         Uvo/zfYW61g26p4FUXn+IdBs8qTSk/u2r4jajKWEZOJoK0VB8gVKsvTticUUtNTAqSvG
         OGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758891492; x=1759496292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+s3+W287EF3WpdqRLN76J6wag+8qKpJsyHBGGlUi1g=;
        b=UAr8Wew5AMtb/BkVON3b55i9RnV5qgmpeki13fs+Xm390JKBh8/GZc/NIGjeOqpI/o
         b172ABtnn30lXH+wp7q162mbHpd/ZF/VkRjhxx9UKNRQshzeox4J5L3/J84qmpzHSB/6
         QolhK4ve6+QCKI0pQrJteRz1YViHRXhkHSKewzQCcha1d/5ut1Lnczc6/NTHQToJq0DG
         1CdnYGJEIY/VoecrHvX5yCFv3OWnSbNLuHBPcbU8DC1eCo8SZcIb6bzEGEqa8xQHyDnw
         sk+p/CrRmf06ac5JVK6AXLDR+5rGC73Nqeb4k0PnFO9JRi+9HW441+S2mVwqxrwBTWVY
         BHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe2uekyf4USY6jXtu0njUDP9oQjgMHzYPeVpRAX6Dd7j9VZ5kBr2ikhGD33dp7v1VNned3X1Fod8zDt2uKLaTQHWdGgw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywiom98e9kVvGu1HEz3kp+TF/Ge2kP3pKHBTMlpUbtoP5WSzdTm
	6frghwge5vmehXULuCZfok2O8WyByVPy7zlQbA5vE+3EBHrWO+pjNMoh
X-Gm-Gg: ASbGncvJSH93nQFFTGmSaabHYcy5DcxE0Tg50LQ4ZGu5Uar1Xq35zD5oGegWJr5ZtIf
	55cGVy1J4IUKeqtrupF42925WHY1LKCkZYTEFSfpTOW1jXC6tkEIniYoguidxyV3DL2+Uep0uHB
	/MagSz4EJ14FBMMU/YpQk1mo0h82PG1JfgOsR6DrEmKVwNzZ5ebdvZ7kfo/YmsnRxjAabUVhIE6
	EB1sE5FfmlMXZww7M6gJz+zchtqmL3Ausp1HxYU2XBieJ65gTAEy7m0+AONn6l0iMtQ3f8LnZAU
	J2zoq9Gz9Qlf3RduohXqZ9kB1X6h1Djk64jMif8dy/fZ4W/1cTwIQqsLQz8EnOQ7sOq9GObj1oC
	4m8BaRhe3SYBykFkZbgx2azRB4eTZi33RR3EouN5NZQ==
X-Google-Smtp-Source: AGHT+IGLIvAM19ntk8+Lddvjl2AdkR8Dpz1fEGG8f6oAy2PmwyG5FhSovK+XEHlRkEKZ9R+AN8qtiw==
X-Received: by 2002:a0d:d081:0:b0:74f:5366:86ba with SMTP id 00721157ae682-763fa430ad4mr57737817b3.12.1758891491815;
        Fri, 26 Sep 2025 05:58:11 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765bd407b84sm10951587b3.21.2025.09.26.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 05:58:11 -0700 (PDT)
Date: Fri, 26 Sep 2025 05:58:08 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Subject: Re: [PATCH net v3] ptp: Add a upper bound on max_vclocks
Message-ID: <aNaN4DtuP0QJZVus@hoboy.vegasvil.org>
References: <20250925155908.5034-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925155908.5034-1-viswanathiyyappan@gmail.com>

On Thu, Sep 25, 2025 at 09:29:08PM +0530, I Viswanath wrote:
> syzbot reported WARNING in max_vclocks_store.
> 
> This occurs when the argument max is too large for kcalloc to handle.
> 
> Extend the guard to guard against values that are too large for
> kcalloc
> 
> Reported-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=94d20db923b9f51be0df
> Tested-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
> Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Acked-by: Richard Cochran <richardcochran@gmail.com>
