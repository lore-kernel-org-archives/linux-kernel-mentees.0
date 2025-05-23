Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027421B8F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984762; cv=none; b=jQW3G9UF+lFuUvJpJWk0vm+FXvMHILkG6h+/lyGzzmvHGAQBp1FOJfqPLCDClWK9N9t9+PRSgpe8Dk13JW3TifjWXHYCEbhqMTULCO8DCOeTOrdnq5Tk5zQAvnI3VPvPuTwGJH+71RSAy8qYHulfC4AvQo5AzPFhwM3uweyCrYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984762; c=relaxed/simple;
	bh=E0ShDCdu9lAOMVz7ALM4jbU551cKu8SSMbDSrCRZxEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9aB7JHcpxT2PH2RRStjKS2griD3lKUU8eWYKHmoneClXQgTExJDVQPpE5ipErx4zCsF0eHEiONWYS++wi6i72BA7XDDkSAy9wxp2UAVa4eQC7p4sYTWQwh3Rv0sjZFTlxp5J0jBxJSkqiD0LtqYq5bO7TLK0U0ndTWvS39dKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6ql+FeD; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6ql+FeD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D8141B87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 07:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CnDdNNghO4v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 May 2025 07:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F408E4039B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F408E4039B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J6ql+FeD
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F408E4039B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 May 2025 07:19:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76859629F6;
	Fri, 23 May 2025 07:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CBAC4CEE9;
	Fri, 23 May 2025 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747984758;
	bh=E0ShDCdu9lAOMVz7ALM4jbU551cKu8SSMbDSrCRZxEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6ql+FeD4AFFmKKjw47tjsuBVAqf9jtS0npqWGk3pkKq/ji4wg2/M9p3mGZNEkp5F
	 lP1x/SjEBOI2Ihf78j5nfdRRPMHb/4pNyXwfyVS9pxN2TUcf1SCDjkcb8W/aoFOIKp
	 AY/BWK09Br3j+yLyeEwB6kwoLxyrul/MzoFr8EVdH5qWMWcaMu2ar/SOcv0bcFqS4t
	 vQvQgHvxV29GNOTk22RUgKZT6nrLCcFSoctur79u/XkvFvXn7PxA387EleEulfpg+1
	 Y9v95a+MS60JrgG7axsv9OIAgcKPLPHxPZHECFdWGDZnkn9XeX98BVkw3pyshpUkS9
	 xA67iJ0A97RqA==
Message-ID: <2390300b-49d0-4fe5-81b5-5a9f3fd9e300@kernel.org>
Date: Fri, 23 May 2025 09:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable
 type
To: Benno Lossin <lossin@kernel.org>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>, benno.lossin@proton.me,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com>
 <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org> <aChczAWsPdmdeen3@pollux>
 <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org> <aCrwuQP46RFHxYB5@pollux>
 <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org> <aCsAEJtkCKKhspnF@pollux>
 <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org> <aCsX-k0K_jqLvD4e@pollux>
 <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 2:26 PM, Benno Lossin wrote:
> I'm not happy with the sentence structure, so how about:
> 
> * `data` is valid for reads in two cases:
>      * while `is_available` is true, or
>      * while the RCU read-side lock is taken and it was acquired while `is_available` was `true`.

That sounds good!

> * `data` is valid for writes when `is_available` was atomically changed from `true` to `false`.
> 
> The last one is needed in order to call `drop_in_place`.

If think for this you have the same conditional, in the RCU case you can't call
drop_in_place() immediately after is_available was altered, but have to wait for
synchronize_rcu() to return.
