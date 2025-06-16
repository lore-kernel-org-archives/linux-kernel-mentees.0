Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9104327AC30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069625; cv=none; b=P0IvWEpLS97wApAHdhPYyxRFy1qe37hqGOCyVsCaQTYbNfoeLjD5lcUYdgUvcjrnCo43Si3gNgiP4in8OgIpeTxOSQnmzrMQ32HO4A90V8qlx+ugnuRqmH9REnB1hJEBk6Pl3ua1AaVqfKO18G87iy69B2C4U/4dLJirx6V7+MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069625; c=relaxed/simple;
	bh=6olxyu+3Y03lElTth9nsN2qcWohq3WZMNnWZpuFx+7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdaYO8hxN+9903uwa2KT7ubifQEnhEFuplS4mcsT6OpeHXuBRqOwOqJt0IWH+UkCjGansJIJ3lJXqQjqYUBRVYt2m8jySQrRmDQxjjBcLZ35PXysdAY+c55AVEuNdBBiPSOm+SYaWncE4v5Mr9duYchHvz4Ng4qyOyo2IU3Qoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PR4b5K67; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PR4b5K67"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2980A40282
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNZ20OX--isf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 10:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EC0140273
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EC0140273
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PR4b5K67
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5EC0140273
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 10:27:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EAC2A51777;
	Mon, 16 Jun 2025 10:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F66BC4CEEA;
	Mon, 16 Jun 2025 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750069622;
	bh=6olxyu+3Y03lElTth9nsN2qcWohq3WZMNnWZpuFx+7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PR4b5K670zMV5/9Gpgy9khBVPmfZd5UWmlO9W2U84NRKo92PwmNS3tVIWwN1ccl/z
	 p640dACw15AvF2gs/xX6G/T6O0hASOAtHIX1z090BnDKDtbTOLcHEPwxJc0xbQbjw+
	 fp75SfugzZ9Wkj/RkMRoN3TO5VGIZu976zz9iZt35ujZjvswbNGYxY1TcwrrU9ouiL
	 wsa51Paj1wc0dBQFgcb9gmzn4jeF63P5LzI4HndIlQGX4606mWAzmwq1N5WGUuom/Q
	 xXvBWZSjJBa7k/hCTVBt2cWFJzXIuJxFcIkZ6t8Rprv3M9sW8aGn2d9PsKWVs5EHqn
	 hEx6UvD/wtHFA==
Date: Mon, 16 Jun 2025 12:26:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org
Cc: lossin@kernel.org, rust-for-linux@vger.kernel.org,
	Marcelo Moreira <marcelomoreira1905@gmail.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: Re: [PATCH v4 0/3] rust: revocable: documentation and refactorings
Message-ID: <aE_xcV766hQacECP@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>

(Cc: +Greg, +Rafael)

On Mon, Jun 02, 2025 at 08:26:21PM -0300, Marcelo Moreira wrote:
> This series of patches brings documentation and refactorings to the `Revocable` type.

@Miguel: This series will have conflicts with [1]. Given that it does not
provide any functional changes, do you want me to route it through the
driver-core tree to avoid conflicts, once ready?

(Will have to backmerge -fixes anyways for other patches.)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-linus&id=4b76fafb20dd4a2becb94949d78e86bc88006509
