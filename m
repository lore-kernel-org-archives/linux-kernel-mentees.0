Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34930E0D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403169; cv=none; b=QU6s523FH6oiwY8aV1LjclDcyJUAkFQDohyfa0SagV7c2fOOJoGkUy+YfrmxzAd5b/k6YUYwcMUNZQeCWLupzjlExfoDDHAbJq7G3i2Ahgl1ON5+jmpYNppabXdACUDR1FS9tSLcEhzdWEuQRCzeOg3H8INzIwUdq+lat1Km1Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403169; c=relaxed/simple;
	bh=2sYsLTjY8UlCSBPDwENuCkzbU8UFYUoZD+Fn10iJNUg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=s9AYCHTr5JsfiN7wCOwekyrxJ1ZO5yG+54qvpZe2Fc/nRguDFJsbwZ6jdC6c3EwY5JwNQC+iv1l1Gjn8VSo3Mf8WtJ3svDO8IwAFsU4Br8xAR99I4Lww9/H/7o5Fl2fYr2+0tuKFZx01irXu4aDoY6nsWA1G/V2MwRRJcrQIfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5918340240
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 15:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.835
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMkuJG-gcHGX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Jan 2026 15:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.161.72; helo=mail-oo1-f72.google.com; envelope-from=32rbnaqkbac0bhitjuunajyyrm.pxxpundbnalxwcnwc.lxv@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5B464023E
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B464023E
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C5B464023E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 15:06:03 +0000 (UTC)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-661066bdfb9so1425974eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Jan 2026 07:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403162; x=1769007962;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMy1y+B9WdDKj6nr6FkI9x1yhWM1Ih1Ofb/HIEBve50=;
        b=vHEMmhn+2TtxkfWZdVO9l/T1rC6/mbsJYDho+/X6yI17hD0haGujKFnxYbKkYMYwTl
         R7rhg13Vdwo0rvn7dy4BR60YrXO8qFeLsasP2xwWZIS5gsSwCXpe6sy3OAF1q0kUBhzV
         m9f7/ZiXFeU5/wgxQqOyyoFPbHS4WHroSm1x/0h2/Xn24jYtuROawY4bzGfe/HisL/oV
         vsPY1hjUI4pPwEly79fHXx0zZphPOJPuoxpophqTN4xy8zBd7CaB6fdMfxoPP4i6WUa4
         DOM+ZPb2lTxiK/9A55YyuW9p8OWmd1eY1yTT57GHTWOl++70yI0ygGMUp9wsND+cuYto
         kFYw==
X-Forwarded-Encrypted: i=1; AJvYcCXtP/4lKI6p8918HJlCM25XMCXDPZ0BMlY8Tv+PIBbUrSMauW6VC0PU3YNHqkjpAp7PGpQbCRqr0hX36TmC5SU6f267Xw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwVNCSO1y9LiaEG8CniSKIUEFZIjJDQUKgOX/qQwVGikoJlRklc
	Aqgu9U8S4C8q56TzwOLbMksEJXN2CD7zL/5ync4hxWQH+siM8Dv8oBXVk3SahOhZHAElAglXOZi
	fU7rwqmEIOBkR1GWjNkrw5lmzH37HCt9X2Jkrhzue4AQOFrrmceP0WjBax1E=
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1508:b0:659:9a49:9081 with SMTP id
 006d021491bc7-6610097d19fmr2203064eaf.76.1768403162431; Wed, 14 Jan 2026
 07:06:02 -0800 (PST)
Date: Wed, 14 Jan 2026 07:06:02 -0800
In-Reply-To: <20260114135643.17484-1-sohammetha01@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6967b0da.050a0220.150504.0003.GAE@google.com>
Subject: Re: [syzbot] [bpf?] KMSAN: uninit-value in bpf_prog_test_run_skb
From: syzbot <syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	martin.lau@linux.dev, sdf@fomichev.me, shuah@kernel.org, 
	sohammetha01@gmail.com, song@kernel.org, syzkaller-bugs@googlegroups.com, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
Tested-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com

Tested on:

commit:         c537e12d Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12188522580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46b5f80a6e7aaa5c
dashboard link: https://syzkaller.appspot.com/bug?extid=619b9ef527f510a57cfc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15f21d9a580000

Note: testing is done by a robot and is best-effort only.
