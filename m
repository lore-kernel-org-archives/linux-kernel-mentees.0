Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368AA3812C7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Aug 2026 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082406; cv=none; b=k/vfeyLDCvtqWB7JwuZAuJrsJ60yn6X/dyyIlmRWkea/0CoH6bvF86M7qa7o17FHsDyE62tZ4cpBpX5enS3se04a4fbd8hMgMmMyRsqfWMfHDiykgsK9nP/lfztbkd4LDYbXp2OjHXmyrW/neFo8rBhZnJThsV+Dsjh/jAwtLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082406; c=relaxed/simple;
	bh=cs9JSlonkFnK9gcBAH4IYHqUYSZMi1dddW2RqM4+dsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt2OgdynokFUtyihxUffE/XvrEvD+t3DxFkN4dSaIlyhsXRxOCxHgS4eE3iUCwE5algoKtOfFEAqC5dOZEWPtRyEvbeeKPS9L3xTIgbd6Jf3N3cmOMBg8znnAjEoGNhNYg0EyxXqRDTJBZfaYAQ+LK7+Eo1QVl6kLS2/9/vfn4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 67U9Wxjk035779;
	Sun, 30 Aug 2026 18:32:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 67U9Wxgh035769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 30 Aug 2026 18:32:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <61c4cee5-3c63-4b09-abbf-bf945b538403@I-love.SAKURA.ne.jp>
Date: Sun, 30 Aug 2026 18:32:59 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>, Jakov Novak <jakovnovak30@gmail.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>,
        Guangshuo Li <lgs201920130244@gmail.com>,
        Runyu Xiao
 <runyu.xiao@seu.edu.cn>,
        Shuah Khan <skhan@linuxfoundation.org>,
        syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260816153809.7067-1-jakovnovak30@gmail.com>
 <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav415.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/08/17 17:13, Johan Hovold wrote:
> I didn't look at this in any detail, but having that call in
> mmc_free_host() (e.g. rather than in mmc_remove_host()) looks wrong so
> perhaps the fix really lies in MMC core.

syzbot has an AI-generated patch at
https://lkml.kernel.org/r/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kernel.org .

Please check.

