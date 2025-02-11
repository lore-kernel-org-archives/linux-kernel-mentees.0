Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0643226A0B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739316389; cv=none; b=ooNrRk8d5kAz9B3uqjEMWgGikuh8lCUlMw/dTxf2uYI39fRlS+SSSRdUJQW32EJIwVQqDL2twaKsoEQhUsEwTY6IfcXWZG72mQpGIT0djWbusIqpSuqRaVNNdENsLNIi4eybz48hbfdh1whj0FUR9wkYqUpt+AodbOsBfg9aLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739316389; c=relaxed/simple;
	bh=5LnETxUqNhj/Ty+sFpEWOJ+kEEqGTxC2idodkEnM47w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8G8BcsTFGnFmvEBvgpWC1FT7xaXxSE+F3uKGsW+dhhtyEpG5PgL9fL1IcL+alrOsh9JqWkDC33qo5VSGEzHCBPzOxm91A4wP5HEkst7r9w8DUXSxKYppP8r+Dn0TgDF6Bm5E5bVwag3YrShiM0bVkJAXapwDB+tW1J5TTS+Jto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enp6uTax; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enp6uTax"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA4260F17
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjawGC2OKcdo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 23:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BB2E60EF6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB2E60EF6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=enp6uTax
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BB2E60EF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:26:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12D6EA40E1F;
	Tue, 11 Feb 2025 23:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C38C4CEDD;
	Tue, 11 Feb 2025 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739316385;
	bh=5LnETxUqNhj/Ty+sFpEWOJ+kEEqGTxC2idodkEnM47w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enp6uTaxSv49Cj3Ajh9uzcim2GHVylLLrNUuO9i6zse1OqhMK/wzoBQ23ha4iYafo
	 9d9G0CdKZHANlLQlVvrhMlqsaypE9n17ep5j7yO08zsmIG7TJP3dlsN6dDeAntKhic
	 kp9uGc1u7JIPld5Znf0R7TZyFgGsc0Yn/4n7ODJSZbC3fkEnCc2cGpd7zqY9XzZYgE
	 pyR5SAwg+2CA4AMV8CQVStcTBL0d9qN8utwBnD3Jdl3wcLRCSqBFUmBy2vkgWTHyGr
	 WzZSBuW0R5sck3bRM5zJV5HQr0+YZ5CaLKbzYus5IUO3R6c8JSL7mpdfZsOpdj+58Q
	 Jrip2FV8qMeDA==
Date: Wed, 12 Feb 2025 01:26:21 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ahmed Salem <x0rw3ll@gmail.com>
Cc: peterhuewe@gmx.de, jgg@ziepe.ca, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <Z6vcnSv-fjzRQ1hy@kernel.org>
References: <37ztyakgrrtgvec344mg7mspchwjpxxtsprtjidso3pwkmm4f4@awsa5mzgqmtb>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ztyakgrrtgvec344mg7mspchwjpxxtsprtjidso3pwkmm4f4@awsa5mzgqmtb>

On Wed, Feb 12, 2025 at 01:16:17AM +0200, Ahmed Salem wrote:
> Use POSIX-conformant expression operator symbol '='.
> 
> The use of the non POSIX-conformant symbol '==' would work 
> in bash, but not in sh where the unexpected operator error 
> would result in test_smoke.sh being skipped.
> 
> Instead of changing the shebang to use bash, which may not be 
> available on all systems, use the POSIX-conformant expression 
> symbol '=' to test for equality.
> 
> Without this patch:
> ===================
>  # make -j8 TARGETS=tpm2 kselftest
>  # selftests: tpm2: test_smoke.sh
>  # ./test_smoke.sh: 9: [: 2: unexpected operator
>  ok 1 selftests: tpm2: test_smoke.sh # SKIP
> 
> With this patch:
> ================
>  # make -j8 TARGETS=tpm2 kselftest
>  # selftests: tpm2: test_smoke.sh
>  # Ran 9 tests in 9.236s
>  ok 1 selftests: tpm2: test_smoke.sh
> 
> Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>

Perfect, thanks a lot.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Shuah, do you want to pick this or?

BR, Jarkko
