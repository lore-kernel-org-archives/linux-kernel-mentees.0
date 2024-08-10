Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767F8157E99
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723304908; cv=none; b=RtZAMERfBd/9pRpXqBKgTszOzMliSeMRkx4MHZwwaTyrqVF4715IMcqHOmUnNmf4yx8rkjmBE7rW3fNECMykwaQT1lUKBym8n6pzFdM7B+0Td3R3PT81E890H2hSD53vM95UNeaKmTZYxpEOKwMfXfa/VSAjvWMKHFHkn2p8dFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723304908; c=relaxed/simple;
	bh=1mAtGESyykUC9Vn380/lHmjiyvC+ZvrqV9V5pkqJojQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHg5WYCdyrUm+jj+tl/fuWzPwiTGOE0I9skiHiAPUEldjhPXQqB76pwLklDCy5pK/tUJ7/Q4nV+CTrKSK/IItyvtYfnM0cNauRNdyeKdLqxSbegyJLJDbpbtB4eWWn5FKOErN0xDlp35+IiwHoZNVRSk/uBMnRSLLi2sgqd2PlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yl5RWHJG; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yl5RWHJG"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EAAD40243
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 15:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZYtm6yE0E_j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Aug 2024 15:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F37FE40025
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37FE40025
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yl5RWHJG
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F37FE40025
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 10 Aug 2024 15:48:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E4E2CE1017;
	Sat, 10 Aug 2024 15:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7C5C32781;
	Sat, 10 Aug 2024 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723304900;
	bh=1mAtGESyykUC9Vn380/lHmjiyvC+ZvrqV9V5pkqJojQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yl5RWHJGJI1i07gLx+WNooSx9aYkVURYbw86gfHsiaVi07o1Tfz2fdApCk48tfrmt
	 /j6GE8z4Eqi9Z4gpf+DAPjlZ8noUNMNfRqvs1611N9hJRZMsyyM6aof7SEd8b746E5
	 5cZu51tPecpFVsHhc66dxZdm0pvdjYGHBJNHlDio=
Date: Sat, 10 Aug 2024 17:48:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Translation to spanish of the documentation related to
 EEVDF
Message-ID: <2024081000-drove-catatonic-692e@gregkh>
References: <20240810094348.13745-1-sergio.collado@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240810094348.13745-1-sergio.collado@gmail.com>

On Sat, Aug 10, 2024 at 11:43:47AM +0200, Sergio González Collado wrote:
> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>

We can't take patches without any changelog text for obvious reasons.

sorry,

greg k-h
