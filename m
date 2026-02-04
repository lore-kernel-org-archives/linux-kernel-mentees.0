Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202427A107
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211212; cv=none; b=dqi1GjCnNa9vXrg4zhBcQCNa65qD7l3TXEEFAjjusz3AQO53SvEZSmVFu6x3+P3o0a6lGMf2+MP4Zfl8c3ID27F5o2XIIDu8G+3Wk2YwIbxcp6cMVuqAGz3BD3GKWIk4w/iLW1G5v0IFtvUUQjs9luNRcvocbSCMJTO6pYi+0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211212; c=relaxed/simple;
	bh=EAnieuO+bo6Wjxuqzy2Gc8zG/xroPGHNMODmAz4YXaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lkD8I//Xosdp2G06/Yz9+pz1RQSp5aUpowv5K+xrBGL+71wYX4LnbNVDiBro+pc1qVFU56nl6zSnttHGEoFR9tgokeC61FkxMQUEUMs2pmzrqyiFHoZvCqlWXHtMFN6FNyO0j0pRyHDNH8jWcOCaTYwa3WZPyBbKZ3y0Rn1h7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYkZVKn/; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYkZVKn/"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5E9060C09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMNRU7k1q231 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Feb 2026 13:20:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B64460880
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B64460880
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bYkZVKn/
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6B64460880
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93F5F6012A;
	Wed,  4 Feb 2026 13:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1483C4CEF7;
	Wed,  4 Feb 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770211208;
	bh=EAnieuO+bo6Wjxuqzy2Gc8zG/xroPGHNMODmAz4YXaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bYkZVKn/oadeq+OZSehj1UNsd0AvEAyUGGl8T0NYQFfTRAL4HyCg6rUOxB9jKv1Wz
	 5301cN+RYmdA0k61SyVnMIyEUZVJ4+GmGaMD02Ro45hPlvhiCrp94fW3RndvNx4mVA
	 iGqGrLLHQtKOR8kkx/paPHQqyJp6cDzgPK/bQUr3j6z+5J7aj6v8mh+5UMJcoRAeoI
	 kf/1plIPQw881HBCStqBP2e0B13GtLYPX9JFXfj45tpgZqB4+haeNUHMGsNKmkchEI
	 DoibrdBevXTvygMtNLTAqJ/xY8SEcjRfKlJihv7l8SPA0vKUeJvmR5u/HMela1FD8c
	 1Q80wQpQ70w0g==
From: Lee Jones <lee@kernel.org>
To: linux-kernel-mentees@lists.linuxfoundation.org, 
 Soham Metha <sohammetha01@gmail.com>
Cc: shuah@kernel.org, skhan@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, 
 Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20260126111309.22097-1-sohammetha01@gmail.com>
References: <20260126111309.22097-1-sohammetha01@gmail.com>
Subject: Re: (subset) [PATCH] docs: bindings: da9055: fix dead link to
 codec binding
Message-Id: <177021120569.1239607.5629414298206360992.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 13:20:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 26 Jan 2026 16:43:09 +0530, Soham Metha wrote:
> The simple audio codec bindings were consolidated into
> trivial-codec.yaml by commit 4acbfcf11cbe ("ASoC: dt-bindings:
> consolidate simple audio codec to trivial-codec.yaml").
> 
> Update the DA9055 binding documentation to reference the new
> trivial-codec.yaml location.
> 
> [...]

Applied, thanks!

[1/1] docs: bindings: da9055: fix dead link to codec binding
      commit: 845776177cf3b75be4e27213425f25dcb630d817

--
Lee Jones [李琼斯]

