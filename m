Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE51D31B9
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 28 Aug 2025 03:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756353551; cv=none; b=MopRsA1bJY2NsaLI5HpGwdIGcY4Vh4CQ5AxF3M3luEyQl14ri6bJj0+ZW8EVshmES9WlZabiShL9ltHsjlniYR5mSgqOBtrwJQy6N9/QyGLY8FXV45VPxIx9K6Parqtg4shEZgdeCrbwMzI/8VkO64BF5Rbs0O9LjW7Djti9ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756353551; c=relaxed/simple;
	bh=z8nlWmcewrjIuxs28VIg73Ri+EWwH9rpVnh6yCtwyjo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RnvWbYWnte04zR3RdR1hwB/3ZhR8qbRoo2CVB74LQAgu1ScZK4/6JSxHLrmrWc68XF8GJDNz3HclM8XexFR8TBm442CbNyCm7pa5dDHWgKFJaMkMf+Vr41TCjlArWgTo/6Q/O0DvetIettElnFfVTI1w1seEw8S6L0jPzCXw7Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ9WHr2I; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ9WHr2I"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso603188a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 Aug 2025 20:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756353547; x=1756958347; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MkeXVh+kSZh0bpVaOUbMs75Kms9BMf5L7YiUVo2l0Lc=;
        b=XZ9WHr2IqnGERECCz/aPbfpvHS6yKdS2izhQtTK/DEJ1U2LSBiz37TbxjJ/jX3oH/8
         2vnfWLTqBaONY2QATNSH3RPTfUuP32SOVa6M7BDJrgh5kuflWCKcNckR9vmgAIN0N4q0
         HBzT1FnOXszQnyVLY8DfYKrKIiSIt/wQK0POyCUBD1dJL2jWD1js48Meht7xri7uHP+P
         pE1LxE9+ktTyFrrgrooUl4uRs+DSduVeE4mXWk2OOHAs0EEJiAyB8ovjUPfD0yEKAn7M
         KAAItZQ+UqGFjRaVQa87dLZ4lLQ/rWSe5BYEWokB7Z7ea/RhSVIqSWaYRDe8PlvVytg+
         oG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756353547; x=1756958347;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkeXVh+kSZh0bpVaOUbMs75Kms9BMf5L7YiUVo2l0Lc=;
        b=LRF0/vUaPyImpAslw9hdCvdHtGVx82h2kCCT99Z2bWFLx7+kF+PknZtgLcN+x/TP33
         UeI+o+rXZ6OVnspDwrpxQZuotPYCKxtymAcGsHm7yObjWL4K5sGk8Z43X+VFy3g1lvKW
         O2n/XaCV7l6Ip4Zjs11jZbcpsXcLKuW8zpAOqY6dOaE7DLFns/W/7N5iIJDhaehJ8E7V
         j4kekRrl3VPXZ3JckRGC3hxm3VOLiPP0K13fANqVWrPpkhNQbH96sX76NJ8L1PMEbAhJ
         7lTHVEdczhwnsYangxmfo6nms0K9/5j/KC8NkF00OGsTpS6vtuzxc+Frem5B7yx5R4y4
         PQLw==
X-Gm-Message-State: AOJu0YyxlbW77nXtG4RJEHyLhzk/C8nrk6bp/pKpfGAQcpLqB9iLfmw1
	ilDAd+vhccPDjhxDEwgZ4oc32qnKULkUmPykBJ2+mD/8Iz7MMEKp8/G+NMCvXA5IRq4rmVpuWe7
	9fweLFuoVo3t2gGMT7AdkUHHuH0JBV/am2Cqc
X-Gm-Gg: ASbGnct0J7e91swmz5a7HJoKSc6wWf5IU8iK8B7eun4LFZfVTWGg8c+zwxswSJpL0f8
	kHK7cllYPZHVCg4AGmXHWPI8VuPsq60EHwp2GJkDmh6oKIYkDTuYf/04jvau4qrq9wuJIERUSzp
	qTnXVv3RldGBM45fV/qfKTv3F/oqLSlk6mX0ZCPGERdFD/RSKkE4W603RDb6ueTEMVcT950cXae
	BEZ3n9cXgT1K8q8OoTQBrkJB/I9h/r4XBc0Mok2xP5AyfmlGFDuwuAj+bWV7l3m
X-Google-Smtp-Source: AGHT+IGm1URIngrZPcN9rwQg060UGaEhvW7eNymoofMPq6oIoS4lOU0aaL1fldYDK0NBlNDa3Rp5cvPE+e89aJXDlJ4=
X-Received: by 2002:a05:6402:2346:b0:61c:793b:97e6 with SMTP id
 4fb4d7f45d1cf-61c793b9ef1mr8646889a12.5.1756353547224; Wed, 27 Aug 2025
 20:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: viswanath <viswanathiyyappan@gmail.com>
Date: Thu, 28 Aug 2025 09:28:55 +0530
X-Gm-Features: Ac12FXxqnwYyFvKELyoUG-sgOj9edzbQpMPziy_CdKY4Y8_rGz6rghv7Fw0a_3o
Message-ID: <CAPrAcgM1nbq97SfZmVNonG-HTA8pQrUQ8_AH4xQ8qp97xFyxMw@mail.gmail.com>
Subject: Query regarding Application Packet
To: linux-kernel-mentees@lists.linux.dev
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello,
     I have submitted all my tasks but I didn't get a "submit
application packet" task in the portal and I thought I have to wait
for it to appear.

 My application is at the pending stage right now even though I have
done all the tasks assigned to me.

Can I mail the application packet or is
it too late?

Thanks,
I Viswanath
