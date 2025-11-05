Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2154930F94A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341277; cv=none; b=ZyTK8NX/vCiR+w8fR5ordi2SR5gOJ5HT6G33Z/Y/KF/sXOR6s4HKrZcZfqIwCGERnFPzPqorZzHn0lHoE39jbJSwJfuut6tkr2pfA4v5f0dT09u288zOodN5D2dPyb4yNWwnYSYqZVpxzCK4oliwx4DMSlf4I3ntJdKL8biQGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341277; c=relaxed/simple;
	bh=Jy4/pQIGMv6ouvKeaMvAaVdAit3SYqxr21RQJFEBS9c=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=olKweuQSGT2ea3zUeC8eiIR5hztuofw57EzCKLUn05QtsQcmj27+qB9tM5C1/S8RTbRO7SWl/RSRoP7T9OLQMuRfI5fM2WboEhJ+o77ooC6usygm/x+onq+vUPcW549Y63ZCB+QAp36sWGavJDbsRrnmmYj7r8KemGSlQsgA5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMvarayR; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMvarayR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35868079B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Py4RYsz5LgP2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Nov 2025 11:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFC8E80771
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC8E80771
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GMvarayR
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFC8E80771
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  5 Nov 2025 11:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35E3960205;
	Wed,  5 Nov 2025 11:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404DEC4CEF8;
	Wed,  5 Nov 2025 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762341272;
	bh=Jy4/pQIGMv6ouvKeaMvAaVdAit3SYqxr21RQJFEBS9c=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=GMvarayR+VvpDw5CWp2/Wj7iPJZdttohLNlXgZkINDoPrkSQl1qraYdducma9qf2f
	 1OSwN8y5ksmzdAKrvJnbNmKtKHDNjSgcjzqexlOkUuRC/URVUuIfCrvZvt2XVylQnc
	 I9KzbpgtTM1G3yQIoVSDRYu/wjeltrCWMo62ARs3/7LF6s+BwTQzbUNde494wco31H
	 lTd1mTWs5ptfHPLce+m7D11S6U/2EiUSXdXige4GhpaeiNEQYzkUfBxmpCTE2P6d9t
	 oNmtZheyGoT2aJUGiq9NehCsyvaN/m2r/Sg1+d0QwcyNISjRVNF8EyyHgCStSUvbrB
	 vqltOsI3d/LhQ==
Message-ID: <c101d5f4-f53b-43e4-959d-16c74a99eca3@kernel.org>
Date: Wed, 5 Nov 2025 19:14:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org,
 stable@kernel.org
Subject: Re: [PATCH v4 1/2] f2fs: Rename f2fs_unlink exit label
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1762339963.git.zlatistiv@gmail.com>
 <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <eb59e101f0b201afb65cb40b38e1b1598039ac82.1762339963.git.zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/25 19:09, Nikola Z. Ivanov wrote:
> Rename "fail" label to "out" as it's used as a default
> exit path out of f2fs_unlink as well as error path.
> 
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
