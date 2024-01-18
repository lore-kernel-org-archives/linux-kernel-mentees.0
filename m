Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD572376E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705577154; cv=none; b=lVs2tvm/tOnbWH/lzZ7zDKP1lIb3MZY1sZ7Xqd/dved2FuXf6K2RcBRcSDxrsEwuLXkuH7d+YeDf+tmjI1dd2qf5JebvXEXWca9o6cdZzS5XAQGQW+1qp+O+ZvfGFtHGb+ONZl+BrLals/IYc3c73qccBk9KJV2XdXIzpWFJpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705577154; c=relaxed/simple;
	bh=ltIlsHyncYZh9G6ou6FL9jWCun5Sv/NuVBeGOU5SsbI=;
	h=Received:DKIM-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:
	 X-Spam-Level:X-Spam-Status:Received:Received:DKIM-Filter:Received:
	 Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:In-Reply-To:References:To:
	 Cc:User-Agent:Message-ID:Date; b=hPXLhUX20sZH+mQVwlE5hsLepdsR38M/CbjTewRDSUa6IJg3VjbuSfbcxS8E+M0TxZADgEQJLOhtakfGS5cPsDGDv5BKWV2zoyKfR/6CO24kXQ3bwBNLHjBhcsiJoMya2yQgMXRbGqH0FD7z316wRr/3JWMdeRRGo9Xg1GNkFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOvplN3P; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOvplN3P"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7A061609
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7A061609
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bOvplN3P
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_er8r-kwByo
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 18 Jan 2024 11:25:52 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D442E60AB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Jan 2024 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D442E60AB5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5602CE1D81;
	Thu, 18 Jan 2024 11:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAAFC433F1;
	Thu, 18 Jan 2024 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705577147;
	bh=ltIlsHyncYZh9G6ou6FL9jWCun5Sv/NuVBeGOU5SsbI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bOvplN3PatCoGmZfileyGx+SvtMipMO+1obhheXJw9QAyD0dZ7ziZudPy3ptBC8r5
	 lvRm4jniE9H6QPHF8K0PlLKBpkI9vh8WRtODBMJWf6aJAbo2TLYdoF+raKAPA+zers
	 GKZUqY53vlk3XHZngqCcaqVkmsai31nTkUN898KV3xOfDsxHHyQvAcKfqduATF5I9K
	 HdGcnGJexDEyOdN9cAW1Vd/IumfdGJCTqC/OPHjuMi+dpXUR5Dk3MFYp6hHo9dZ5SE
	 7A/ncDDG7An0HviDsbQqXkHm3K2qpFLviYmmM1w+jqvayLUcLbCbW6uWqc46NveUnx
	 HSvCMupCtRXSQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] brcmfmac: replace one-element array with
 flexible-array
 member
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230803052238.12147-2-rauji.raut@gmail.com>
References: <20230803052238.12147-2-rauji.raut@gmail.com>
To: Atul Raut <rauji.raut@gmail.com>
Cc: aspriel@gmail.com, franky.lin@broadcom.com,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 linux-kernel-mentees@lists.linuxfoundation.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170557714390.2924528.17502971662803875744.kvalo@kernel.org>
Date: Thu, 18 Jan 2024 11:25:45 +0000 (UTC)

Atul Raut <rauji.raut@gmail.com> wrote:

> One-element arrays are obsolete, and flexible
> array members have taken their place. So, in
> struct cca_stats_n_flags, replace the one-element
> array with a flexible-array member.
> 
> This fixes warnings such as:
> ./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

Arend, what do you think? Link to the patch after "--" line.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230803052238.12147-2-rauji.raut@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

