Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE120245AF7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465202; cv=none; b=FKdIf/WlZi4H36H4YMgPVKEzy+e/3da+ELWzfW+qWtgb4vW4j7DI2Ip0jyEmFt9sMvdfAMF+WV8sI0PTiaavFD1Efyd62elpF22G2i7FCEo+eFg6YgSfD5GI/PVa9v346fhS3yUbrLibs1wbiUq6AFpEyeHgeQYTEzUCuPppvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465202; c=relaxed/simple;
	bh=7MnmMrnzdp7Tha9+9t2+bcP9SACYRnNvBdJrozvaUgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HC60gYCeFwfwt8Yhj4LhC/XeJVEbbj39RRhnUfew1UihWUdNBqNU7YISP7w7NUHNhR3T8q4mbsXbchIEr9N8BdE4X5i7eYCfCGrfmtFZ53NcVegSg5cP4auieKP4iCOHIGXf+qAH32rE4oKBt+eMF8HRjRYG69QykVr2iOop768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnmCJccJ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnmCJccJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B4180DA9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMc5PRHeJ1PG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2025 16:46:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=tj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0ED282FAE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0ED282FAE
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnmCJccJ
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D0ED282FAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Feb 2025 16:46:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58344A4028B;
	Thu, 13 Feb 2025 16:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37912C4CEE4;
	Thu, 13 Feb 2025 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739465198;
	bh=7MnmMrnzdp7Tha9+9t2+bcP9SACYRnNvBdJrozvaUgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnmCJccJlU8PUjGmVOoioKFlGWP/uhKOSRgfkWP2+Bn8oxHVE14A/eL3KTU9a7Q2j
	 O9ZUQTVMnO1xiGm5ge7B75boa+/IgH6pypFygFIU11wxgJ85MxN2sF0V0IybXnuiCq
	 9Lj69/OZVOf61S4XCYRA+4keS0Qhi4GTogz8mVAH2cDuqXskMc3h70iDYPSD9NXp+f
	 rNJg6/NLE/MvN+sW0gEOSHkYGHBYPjL+Ms/WesfxgbeEDgDYiqFjjkeoz1tse6VTIU
	 VPwYMElVY6LPUVfIbYnELorifjk1Mb7ecBZcnjBW23gzUy/q6BtpGRBkdSdQEmL4lS
	 NQK3LKzhLaf7Q==
Date: Thu, 13 Feb 2025 06:46:37 -1000
From: Tejun Heo <tj@kernel.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: void@manifault.com, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] sched_ext: selftests: Fix grammar in tests description
Message-ID: <Z64h7dCnOwo3SM4m@slm.duckdns.org>
References: <20250211171851.1518556-1-devaanshk840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211171851.1518556-1-devaanshk840@gmail.com>

On Tue, Feb 11, 2025 at 10:48:48PM +0530, Devaansh Kumar wrote:
> Fixed grammar for a few tests of sched_ext.
> 
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>

Applied to sched_ext/for-6.14-fixes.

Thanks.

-- 
tejun
