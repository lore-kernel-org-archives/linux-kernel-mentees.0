Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1236279786
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Apr 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919241; cv=none; b=Y5bcY5opBknhnmNhA1Fnd3yqmDUEWgVTnm5nvHozh9DJS/NLQ/T5Dy/4jjPz+6ruy1Q019Z7A7F7CL/ICDDuB7OT81OqH/1GiMpwTHClmjdnhCq6nZ/ZQ2Om91DhmU08O37JQ4VY8bVgxGZlYUoTd0lLp3E4j2JEwUYzO7oV840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919241; c=relaxed/simple;
	bh=TcdktHEeVOzjJq1rvLSnbMHkyk/WQ23O383RvcZ0T/M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=a16+rDc8YbQ/juAjlwDydA9QsZWIlX2WINKFVwQcjFZoo9wsNWMq49p3BaTIy+ze6wmsmurqn6HzIk545aG6ezdAsD6CLxTErgZDsfg7DM1H6hcfHpWC8uApYeTqWipEbuHo/123irOVAYKtm3XHwysE2LCb5GwW/8sPWeFcPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcbFhyIu; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcbFhyIu"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b074d908e56so4261145a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Apr 2025 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745919239; x=1746524039; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcdktHEeVOzjJq1rvLSnbMHkyk/WQ23O383RvcZ0T/M=;
        b=bcbFhyIuLGnPTSy6+U/mu0gx4sstEA7+tWFzvJa85sJEVit0onqJ5cVwWRHQbW9o03
         CVxyO1+5fi9syGdZqbRX/sBqnkV/SV5eLYL4dAALoCtRwyFBxnlbSsNcmxlE+qgYj78y
         vTHynKnZT43YhaDGo6tQ6e2LRvbxNpqxQgSJ5Fy2N5vdSUmur05lAy3V5668/H7UkzJh
         4VK0a5fcToYOtISTPTDoBzzxve0Dx8YlhO4pWG/DgbaUt8M9otXal1WG0Fb2ZUNtDr2E
         1NaZ4P5c9pV7AqLFdBSXHuKTlbVE38XEtEQf4N0jNwNwTBP4A3nREfWxQhqcGBJ9Xx7R
         dLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745919239; x=1746524039;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcdktHEeVOzjJq1rvLSnbMHkyk/WQ23O383RvcZ0T/M=;
        b=YkyCuW2ukw5VrO/Nzg4wLRqPkHM5hea3M1SNitqDkMK7GFG8CTCX4Vb8ZzkoSKOBAH
         TaDn2bkDWQw+5udT/wHHoCP8nkxNHjlhzDYzxP2ENiRZ2jgo4uVPckOsD5Z2/z3Bof3p
         7c5PwYjU1Xe6HwYJRz/YZ6iRISzUsH9ZL74CBicBK0z8WoFJ98EMxQG58biRR1QGV9nn
         brbqfHkQ4CgBtvzmptvfXUuJNbDQx2d2mubNHPF67Xqc0CRKpaSiN5tw1fqmU3B+akau
         YKSWX086BJr/t9T9uuUA9Gg8Kb4F5I7scMp4J5p7k+KUSKs8hFBaS+SMfVrGJB6W2+Ss
         f8VQ==
X-Gm-Message-State: AOJu0YyfMzaHh8jzKIQkQsysBI00nzHtoT9R0NmjJKTdW8zgAuhbf+mD
	u4DKfPcQkgaVew9Ys9rSVCZ69hDIj6OEX8WLnULz4YyJ1K/p/fY0UqtD3UOt1Bb0KZDQfJ5WLY+
	t5UfATgvgjyXAI5n0Rz3FXObSi3bbWK4=
X-Gm-Gg: ASbGncu7/CGRRqRw9VrtaF8jjrxNs9QO8+o1ht+9bwDTICh4AsXa9M0QK1wlvswNRfW
	ZHcJ3tfz8LEe7gyz+gOGwhREKwFGAwicMQ/4cYxuIvLjdF6kyVRvjsN6qwdLilB2TQQRcKyegE1
	35ceN/k+On+FwAbdkricvELw==
X-Google-Smtp-Source: AGHT+IEhB6MFJ/FfMaT7ttBTH7M5aC/FduqUPp5urJaXVn+NuJP3nQhw2KzlU9AWwgkV+z2WdUPFsQ6uorE2DffWjT4=
X-Received: by 2002:a17:90a:d647:b0:2ff:5714:6a with SMTP id
 98e67ed59e1d1-30a01340e04mr16415795a91.19.1745919238934; Tue, 29 Apr 2025
 02:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Tue, 29 Apr 2025 11:34:43 +0200
X-Gm-Features: ATxdqUG1w_M-RUkbbtsGOmAHiUq8jku8WMfS6rsQ7qZBubyRHSZt7Jm1zIAEOlk
Message-ID: <CANBuOYoZsYcEq1Ts2QTdGoX8345rfkJnLtL38CDef3UmPfUx9g@mail.gmail.com>
Subject: 
To: linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

subscribe linux-kernel-mentees
