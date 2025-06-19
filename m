Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED7221883E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 19 Jun 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343157; cv=none; b=FDkJnSEZdDlPNz9U97HByApP0PwLjFIbHgU52uaZVVENdXb7lPQL+1aaaVIBENJ7TlIgYLQJYEkxv1ai2HKYEG1rIoKrwYy9MGpErIJRagenheT0xSHF83aknVJWqcDlXKfPyNqY1OQ18cDV8rZrJBU2NaGAqgrItH33r4G9/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343157; c=relaxed/simple;
	bh=XivIsKtLHxsnTwVlRhl4Dr8yCQ88AWH5wGjsQuso/gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYVOniee9kd84/d5nhvhgQzWEq7boJvooCluRP/0HtDD3n05siq9UqdAAkIFq1LwNpHxcKdQItHp/dnohJA61Qnt+xl8YYJ9tCLmSpDb3cjzMDLGepFM3HO2zulwcAjmyu4X0fl3TCtExfU+Fi8msrMFfdurHOQNF4xlDIXCg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DlLhstCJ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DlLhstCJ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d219896edeso103713385a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 19 Jun 2025 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750343154; x=1750947954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=DlLhstCJI3lrQkW8VjRUd+iDiJEbj55e5rYRnsZlJcvlgF86V859kq7MzvkeNGSP1s
         vfuy6kMXlgqhruzDZcuEGpXKYWB+fjE5J+/sbQtuFl+C7YWsj6aki/qYwfFjoa4wGKAt
         hshskzrHHN6RtsxyxNLXwzJFx7ec0k9/af6M6fpecMf5iA1/DQ9CyI2QxTvnpCVrJqR/
         L11eBQz1HX5HQlcFuyUKFhd9GjqYiWE7l2WR9MF0lPsyc9El0Rnd6DtHEBLu0hg+I8zk
         4iUujPguvAJxOnQISs4m/ilcklWoPKMH0Y2spMtquRHOWn0jwNUbPFNRx1+zDBW47DMM
         T6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343154; x=1750947954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=KOejR1GBUO7i3+0HKpbrwjA0amKIw5YzN5x1dJ/58LsbKaF/LVnkqsPz2nMaSYzkre
         ir5dTzWR6qws8fVdmkDZHLBexo+cWQg+sCg94vGFLmunwZjQ7oEN1h7eDht0E68AWa0r
         8aJuRfeQ6e/TJzSE9JzI5j0cVZt8j4MQDiT0GTwpkT5n3wSUP5rWG00NhkJS0c8nAfz8
         iZQ9PRGD0DBz57FBogYdxa0Z1MCNnqwzpDr9/kNFg4CXjU58BYijl89oVsbWe/pTQ5nI
         OQ2GNy8fhSwOJHTLo8HIRjggIMdtEU52c62zD7xeNaKfTzC3T9N7Aa8F9Rsq0rPIO85K
         BEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+hnMTgeVnUgTVGgk+IoNjpVo1j0VP4/jSCcMwpULCpHZfaK+15L+j1nCdnmAy07s+PuEuDAyhRZhO7cZFODLeOVpHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO/rlLiLDcRPqdrTe+38J1IDmg/ujiuBcxY+dnHwbA0KQxpN5l
	heU25pP8gbl5aljzdeEX5IS1UhG5sBDdOx15HcDsELfIZ4XHyHaehiH0Yq07pmo3gg==
X-Gm-Gg: ASbGnctOpz8ISqJuA6bSf/XLUchST0loY27eqpFX9V8s8o1NpxoUT1poKGQLWKDzlDJ
	4vbI4IVDa67MnUhD68FuKt1VXdvv9vMYdAGB/iWiTvmma0IaluGxVFbX8QRYK0Q0xlrt/MDrXQx
	6lmYemfJVuMwoAm1lQBoPy0hZkNiwR5OAKPHIv/6EybJGBALWordyNwDQN1hPB1wSx+M9LvUTLj
	PRm3mjkDAoClfbr9ZH5wupAwht2sy7iEUiCz5TvDATXx5go30ClThKF0uXA4FxQ9CFuxB/y9Qgy
	uSWv+3W8lc4tPcMWirxAxR0DgDVovxYO+1t8OPcCpVIb9bgX5HcqFsf+c1MbiK8=
X-Google-Smtp-Source: AGHT+IHoxGFmOWyxo0l5cv3zNYUJJmLzJxOJmUnEXBZTUwO3KalFcEgAIn0/tUUNPftUnsVKxRmxVg==
X-Received: by 2002:a05:620a:2a11:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d3c6c0c737mr2951152985a.12.1750343153662;
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8dc9378sm3558485a.9.2025.06.19.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:25:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Message-ID: <20d37e05-c496-499a-97a2-bcde9b7fe958@rowland.harvard.edu>
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>

On Thu, Jun 19, 2025 at 02:07:11PM +0200, Hendrik Hamerlinck wrote:
> Per Documentation/filesystems/sysfs.rst, show() methods should only
> use sysfs_emit() or sysfs_emit_at() when formatting values to be
> returned to userspace.
> 
> Convert the uses of scnprintf() in sysfs show() methods to
> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
