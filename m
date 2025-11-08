Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C02FB094
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762597225; cv=none; b=CBxEhXmLrmthK/3sL4RokvcMAUt3uJgIM0rWyAq2RXsyJqumpSd/8tSgeG7SHsXHeKIEXcE6bg2pjGOs9vSJuBqSe4NrlZBvdJWsRm7MuAXwA7cF6ebh/QRoN7lmF2e3fkp9+751Hxgm4Ex5egm2rZwo3kcH9TyFZsjrC2GVSNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762597225; c=relaxed/simple;
	bh=8a4HP+d2FfUB1WSXBOua59ve8+CanSYwYah1hcLW/N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA/aiDWCStm95a6KrwoD4IzLIke5y1fk+W9W/pveYE+LdtdehzSV7uh0dvfezqmgrgN4sMHFM5153HyMC88LWp+VGqZzMaEzSHD9bD6dtUAuIH1rjsvDsnRvtoHoZqZtr/SjueA1x2iVNJhJ1NeePAdRzyR6rVrYR1sMKcoP3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5A8AJwlI005978;
	Sat, 8 Nov 2025 19:19:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5A8AJvkD005975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 8 Nov 2025 19:19:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <c3b11943-f8ea-4283-9d88-e442bc8ff547@I-love.SAKURA.ne.jp>
Date: Sat, 8 Nov 2025 19:19:55 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: Initialize synclist in metapage allocation
To: ssrane_b23@ee.vjti.ac.in, shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, dsterba@suse.com, david@redhat.com,
        shivankg@amd.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
        khalid@kernel.org,
        syzbot+cfc7cab3bb6eaa7c4de2@syzkaller.appspotmail.com
Newsgroups: gmane.linux.kernel
References: <20251107200645.149093-1-ssranevjti@gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20251107200645.149093-1-ssranevjti@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav202.rs.sakura.ne.jp

On 2025/11/08 5:06, ssrane_b23@ee.vjti.ac.in wrote:
> Reported-by: syzbot+cfc7cab3bb6eaa7c4de2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=cfc7cab3bb6eaa7c4de2
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Excuse me, but the reporter and link are for an ocfs2 bug. Please correct.

