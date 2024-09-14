Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07112D75C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726302011; cv=none; b=EOS1Aab5RTwTbA190wELeVBxPlhvGits0KGC4RRbwVrL1GS2cBbL2bKKNkT+OS9zSEhgr5GLpNfJcHkXwa2oYLOJdZa1RT5Cc4ONCLGC7helN7pru1haxPzI+La1g4Ihr+A/bXOiPv05sOqysEWMIq2XX1xTfU5vBovBndklwVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726302011; c=relaxed/simple;
	bh=BdEHr6MlMYdUc4wPc5gSz110F+OA37NuTp+H2YTZXVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp8vlGpBBVJTw+UdgaZKZN/msEZmuJugbg44ZgV3sT4BEBlKeJgv/BOcxkYyDou/wjoI2fYhQgkaNUMX/SAyxSRuVOkQKrieXiAoqpIh8h23LehUcQPvU1CnuvMowDpiGereEAetThp8c1HKonWUvK14X59TtwoH6Qe1pCKgJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=txCSSywK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="txCSSywK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5848540302
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 08:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ejfv_tAq9vY1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Sep 2024 08:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D171C40597
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D171C40597
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=txCSSywK
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D171C40597
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 08:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA3695C4607;
	Sat, 14 Sep 2024 08:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBADC4CEC7;
	Sat, 14 Sep 2024 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726302005;
	bh=BdEHr6MlMYdUc4wPc5gSz110F+OA37NuTp+H2YTZXVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txCSSywK9pnDInzJ7b+U1EHHW3koj3HtEW2UDGcAkLIKl3YXXvt3olW+Trw3VEHff
	 ialW4hHbjJy/TT2+DsqX8Eji2V8T69e6ONxW/hMkIUZQLaG9rTDJRHwSxFqa9vZWCU
	 ZY9zr/VT/m/c9GYkrOSn4rZIjzuCgWoC5K82A0s4=
Date: Sat, 14 Sep 2024 10:20:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Use new initialization api for
 tasklet
Message-ID: <2024091424-glisten-unmanned-bb8f@gregkh>
References: <20240913191734.805815-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913191734.805815-1-abhishektamboli9@gmail.com>

On Sat, Sep 14, 2024 at 12:47:34AM +0530, Abhishek Tamboli wrote:
> Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> initialization API").

This says what you are doing, but not why you are doing this.

Why is this needed?  What bug does this fix?  The code is the exact same
afterward so why should this be accepted?

thanks,

greg k-h
