Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0937885C65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 May 2024 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777948; cv=none; b=odg214+zh22JJu8+b92qoVXwy6srHvQpBAwIZYL++meI8u6lU/nPFwfR0N5XiskaPtetUNS8kRW9ZMUgV7zxqj3iHUa8gMTFkNEQqFHxqb+LwT8P8AZm7HABSOhJR6xsqsCEBpF8JJ2v0qt7wcme0PdwTvrNVWL1Ztdaah3iKrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777948; c=relaxed/simple;
	bh=pU0KDP8PaOrGc7nhuKl9eruKdWFqqXHiWy9Dth7iatU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ocb7t1jSZ0wkywwFdJSTrerq89uCMn+qP3fXmj9KufVvaTHRKaz5RgZPJuNWzB5C4TSbKuFFrN+ughouTYXTYlbldBrl4QgjRnLGEu3zwIcdRgNRwrJsoubzHwb7gCxvD6krDoTNm0c73ujhH1XvlcO8gtMIykXfCZ1q5rdLkKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC16241A43
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 May 2024 12:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.853
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4RLeG0xQUAf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 May 2024 12:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.69; helo=mail-io1-f69.google.com; envelope-from=3l7fezgkbaey067sittmzixxql.owwotm20mzkwv1mv1.kwu@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51DD440105
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=syzkaller.appspotmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DD440105
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 51DD440105
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 May 2024 12:59:04 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7e1bcad7693so643773239f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 15 May 2024 05:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715777943; x=1716382743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PdFyk99KlLZYyjH5ckDM9d4Mbdv6L9rZe9o8cYGsMQ=;
        b=qUA1m9v7tNn13hafhvK/7hhOEGnka1ptPoTIaDexTgQ5OFVF9prB8SFRTe6mdQYRcu
         hoTS7AiTFQvaOHAYC1t3LODqwKmBAb87tUXYK8y8YR+tT2a2Lv9My5vQs+O00H1+SL5i
         q5Qze+dF7IadGwT3LEJxCaPYESP81Rfk91gqKeLnm5D6sodjwhnvzYoUA+FSyma6g64R
         QIx9pqYY0mPfNyhEf60OyJ2gOflWPLvh0pUTs7pik9VvP73h2CqYzeWov9c5vKI4n5Ud
         Fi7TZURcyb7aWY63kuYTQdql9GcvsKB1gotLjORe2JRIW7/I1LHm/1X905Lr6is4Mx5i
         5RJw==
X-Forwarded-Encrypted: i=1; AJvYcCWhO4KktknO+jMAf/kS4bAhQd5p4poZ6qsIajdQjZV6Kc+Pi0ROeKUOu+rqWZS/G6tOCTOdT5q+Sz6x0HwSPBNyNZV12w/SmHdG9MUyP6LIhLj9glw7R5gByKgia9at
X-Gm-Message-State: AOJu0YzgxiOZ72cNx5TKMXrtUV6zthY1cmXfrAbN4n3cMRDhxaVgMgFp
	tJDMAZ7gPaTVLm6lHKI0SV+z78w5pj/kKC/r/7MCYvgM1mie1HtTL0lhDOVzgO5R3w0Cbpgw3yE
	3R3bHQPX9x/drJzKWNyzFFJlM99ZFiJazVOcL47iM6sZ4YPwn3SBKnRk=
X-Google-Smtp-Source: AGHT+IGZaAUobKyp/kGTV7THt978f/NL99WtCI80kanlZYj9xf9fMiK/SHuTneYWfG0Bcc4mFoW2xRU0e7OFh7WGF+spPvbLpaY9
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8305:b0:488:e34a:5f76 with SMTP id
 8926c6da1cb9f-4895955b89cmr1154319173.1.1715777943434; Wed, 15 May 2024
 05:59:03 -0700 (PDT)
Date: Wed, 15 May 2024 05:59:03 -0700
In-Reply-To: <20240515123946.874688-1-andrewjballance@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d50ab606187dae67@google.com>
Subject: Re: [syzbot] [ntfs3?] UBSAN: array-index-out-of-bounds in decompress_lznt
From: syzbot <syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, andrewjballance@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, skhan@linuxfoundation.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com

Tested on:

commit:         1b294a1f Merge tag 'net-next-6.10' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15998648980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c0cd0c5dbf8ea592
dashboard link: https://syzkaller.appspot.com/bug?extid=39b2fb0f2638669008ec
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115b78f0980000

Note: testing is done by a robot and is best-effort only.
