Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0817CA19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Aug 2024 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323604; cv=none; b=Wd67BI6SQfgiqyotnYzkZD72OMhi5jg0r14tfEus+jKW2xr694RqTsczg3UfPXLPUD9fWYOPw4lQVUdoAwayhS8v4FZhP+XzeKhya9YxSPX2UU5pQmuSOvNrBIcfrkGTcV5etdgPThN2Jd8o4ItNx6jFPIbFiF/Jyca+SVMkRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323604; c=relaxed/simple;
	bh=485sC5htGkQO+bcO6uAudwe1l+1z182B98DT/0EBhQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LlHqo37pNVh9ZEC87+2/yN0I0LEtwCE2hglfB31sEWk2YSliZ+LWJOja+LJwfBtvXCkdU055QRa03FOD2ZONMD+3d16DRV0F380iyTJaCUvXCgWl+jPb9z+1fM0u+ylvouaYeK3Tx6klAi24yZ1O8+TPU7E854iqTKoNoCZ4RJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQiRinaB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQiRinaB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD2C60B2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Aug 2024 10:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDSmD969BWOi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Aug 2024 10:46:42 +0000 (UTC)
X-Greylist: delayed 401 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 22 Aug 2024 10:46:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED70060B29
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED70060B29
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CQiRinaB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN> 
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ED70060B29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 22 Aug 2024 10:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2ADFDA401E0;
	Thu, 22 Aug 2024 10:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E6C32782;
	Thu, 22 Aug 2024 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724323197;
	bh=485sC5htGkQO+bcO6uAudwe1l+1z182B98DT/0EBhQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CQiRinaBV9nEhy6u5Yd1esF30tlcz2TZT+eJs5cqZuQNRytLysINpr+WCaU4EVQUq
	 ZEaUe4ndARtlRJKQdRoR/wlN20gmiRHoMm2mwMZT/o3YSPlgkX+zVqXLtk2tRkbuZy
	 6BT52w5nEUqi9HfVaGsoYO2g5Ah1FTMQNEVcD3Fa+puREG8kSth6ijUIPmk7HQceU0
	 GhkREw0EKaRG9xxhWIte45I5mGfDNuV6SI9/5hi8s4GqQbyfL7mjTh9GI1UzbPZ+9K
	 XVP6n2gu4floh79DHbyk8AZ5dhSdY6C7YcUt4eWie0jkPxDfznZ/DOsThonSrFq4o2
	 006SeUe1b3KTg==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, skhan@linuxfoundation.org, 
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240816171129.6411-1-abhishektamboli9@gmail.com>
References: <20240816171129.6411-1-abhishektamboli9@gmail.com>
Subject: Re: (subset) [PATCH] leds: sun50i-a100: Replace msleep() with
 usleep_range()
Message-Id: <172432319478.1263517.9477247439443460396.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 11:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 16 Aug 2024 22:41:29 +0530, Abhishek Tamboli wrote:
> Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
> to address the checkpatch.pl warning. msleep() for such short delay
> can lead to inaccurate sleep times. Switch to usleep_range()
> provide more precise delay.
> 
> Fix the following warning from checkpatch.pl:
> 
> [...]

Applied, thanks!

[1/1] leds: sun50i-a100: Replace msleep() with usleep_range()
      commit: 8f3f07517834382e819e168740bf855273f13d47

--
Lee Jones [李琼斯]

