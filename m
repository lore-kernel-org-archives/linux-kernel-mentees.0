Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58084C6F14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jun 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594129; cv=none; b=pLud/G9ai9GDXI6ujgOcrLLn4ctwYW4iQJabHmG2tUicA//0AxpA65TQEZ7dB/28/A0g+kCdfycIDNAz8tv8+4Q84sFt5+yoLR2JoOQJB/3siJRrgkcKn85o8286PiHKhOtGmV5pFnPu125UXbU53mUBDLmopu931SlQ7suZNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594129; c=relaxed/simple;
	bh=FE/zpAIJ3+uA18zKSazKJm+9T9PyK7kLMINlO/kRdrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p65QmCBCZbhEfhwirk9PCa3DDJtJXu9riRk4C9zamZ4IjyUsmI63bY2dRREZr+biif7VyTyJAO+UFUJ+OTMDEVRjh5QM+hoVludsgqYcyu4AtT2q9/pzveYvuYpLvZ1zwr/K7E9gaMjaKbBOpPDBXT+l7p8dveibZqmZAUM3dyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKC1thbz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKC1thbz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EE16F78D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jun 2026 17:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7WwMBKH8Eon for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jun 2026 17:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 647F86F787
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 647F86F787
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKC1thbz
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 647F86F787
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jun 2026 17:28:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1983600FF;
	Thu,  4 Jun 2026 17:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E350A1F00898;
	Thu,  4 Jun 2026 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780594125;
	bh=7im0k5oW5XfUrXHH99zBcEKuYwrSW9WmaNTeeDdHU6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hKC1thbzicUfYEznOZQjP8v3o0MykMvpy8aNDZ2HICZbqfqyuykI/CQKdLpQovnMk
	 g6bO/deQYdXem8HKUhPUuiK44853VxmMdifZRzi+h9YAG1U2v/054Fr/tComocdigm
	 Uc4BfTHo6pPqJig1DsVE8fSpP+/kGtkRA+7toSz0l5S8uC7mQn6v/b8NJHX0Ou0Rsc
	 qJfoOV9Fx6KoLZmOzbYxaepwa6YO2ZjtyI5jZHSv6KcFwNzumi6sUcjZXP2OIaKjCi
	 pQpQYVThxH0ZsiVl9BCRtDOQrv9ifPgpBDoZsrOQFKOlndl3w9XD/9KeCrrjraG8pm
	 mvLF3K39AIZFA==
Date: Thu, 4 Jun 2026 18:28:40 +0100
From: Simon Horman <horms@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: alex.aring@gmail.com, stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] mac802154: Prevent overwrite return code in
 mac802154_perform_association()
Message-ID: <20260604172840.GE3920875@horms.kernel.org>
References: <20260602054133.470293-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602054133.470293-1-robertusdchris@gmail.com>

On Tue, Jun 02, 2026 at 12:41:33PM +0700, Robertus Diawan Chris wrote:
> When assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL, the
> return value assigned to either "-ERANGE" or "-EPERM" but this return
> value will be overwritten to 0 after exiting the conditional scope.
> So, jump to clear_assoc label to preserve the return value when
> assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL.
> 
> This is reported by Coverity Scan as "Unused value".
> 
> Fixes: fefd19807fe9 ("mac802154: Handle associating")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>

FTR: An AI generated review of this patch is available on sashiko.dev.
I believe that review can be treated in the context of possible follow-up
and should not effect the progress of this patch.
