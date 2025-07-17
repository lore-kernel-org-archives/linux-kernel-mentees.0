Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70982BE039
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752769784; cv=none; b=Cnk+mmjvRPI/rs6qvVlnchHu9+GHh++VSChoPrr6rde0vKuxNKf/k/xAjjgPWIfaRu39EvNyuxYGz2iSA7tFdUWhrlStD44MdGusF06KOAX0fEVWWsIZnwC6b/Gs70kRVMVxQ3qZIIqKs2tAawZNAWLf0eLb+J4VnC0uJbKkZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752769784; c=relaxed/simple;
	bh=4T//cx+PBui7+xLQ7D5HN8zxl1NR0USi+TkVpVUdeW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=APnYkvllpE4qB1ERhrU0fD8OHpQLw78ZKXwFLKPBGB1Z2+6AmB1cdw47c/hKYQK4lH+RcJNXZlHSbQDB/sWjCnT0ntYYEgj7z9qdcUmEGzTV/Or2MnEdTrmqg90+wtgLGuQ9udVN+vutJKeqwcupwolfD0XOz9Y5fdXmC54tFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV920N2o; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV920N2o"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 636AB614EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku6yDmXWI-3U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 16:29:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=ignacio.pena87@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0DAF60B5D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0DAF60B5D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bV920N2o
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A0DAF60B5D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 16:29:40 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-73e810dbf5aso92965a34.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752769779; x=1753374579; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqCVpUJdUteScqJGE8fxb7hF33z2bhAuf6UYKoLwtVY=;
        b=bV920N2ooSjYKsg4Gb7ffcddX2ZUWMvhAR0DJ+cCInBHVzNJAIYnuTvpIYETWxeU+n
         Rb6n1CAlZMDwqWHwsjuVBpGvmHOR08PArzzY80RnhzClHSG252/2Xj07UiN2To50/g6M
         NSCAO7SgKMqe5qkaNF45/lnjXTLQoJgVzDJtb5RX9dPLz5rXSMg420093ILHw04YJILl
         wMNp1XIDfVdMHIfQ3FrXswnnC2I9yr6ido6k5KmJY9EhWsYnhiLffN9R1UxZPznZxkeP
         5Cv2Oh2gyEcNSzcDiR7pdpX7T6y+hh/3WBxTEWTPwWkp98N+G1joAT5TZc8M+Q2yHB7A
         3WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752769779; x=1753374579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqCVpUJdUteScqJGE8fxb7hF33z2bhAuf6UYKoLwtVY=;
        b=S9TRxi34Rd8+DH6Lhdc6r0TqjvP951jMzPkQN6nyyWCrSyMcs9S62tIeI8wKQ9bxjB
         601kDqmGZ+h5aPyyj8e6UwmdwUr8Kz9+Xqevl3vU1vHYxz5CvSEusDxIFnhwwAY5yZAQ
         nndU7lAlAIDimC56/kuuEv4kCMTsLrcOx+nrUEAQYLhoLUDMdkXO7+EJJyOP0BhuHUfT
         /4aQlZ+3xGDNA8ROEp7GFgiZZZstU0telqQZyLQXym0ZLeB6qXx+nJ2ucWOQRa4aFdSB
         xeLQfel6PclTa8cWgDmRlxOSWqZlz63jvX2GhUkMWBOzcojIzN7XCuvvRN9iPEaROX+i
         nzVA==
X-Gm-Message-State: AOJu0Yyi8vi07N5TrzK+jflWf60hRhww1Dtodb3YI9pR5A3qLO1byZDl
	nFnEByF2yQq5sGp6yUFeLZDZrFsdXU/ip/o1nOqPferMBvOYW69gyw7C
X-Gm-Gg: ASbGncvnXAwxW9imlwOXOp88f9oDAxbZGvVIgTYE7fTpBYmR7SXwjZqM11FEuwaIdZn
	RlTKQG9RQauRQe9TxvMykhhOP32u7/j05OX/US+VRvs8ewf9VCn6hjwyQr3UV80vBXd2i2w1N//
	8lQNdj8xyvJfQe5vqmfsVxyIc0vIeLZkEePnVjaxZazOKiNXNeyl/l2HdyRzb2t9g5tyaLt8Y1H
	7ZXMENsYpLCYeIlPGo0mbN3HSTfBGL4Eaij/TR2IsCt09WixO8BopZRrlaWHHnTwG+coJSTD2Dx
	PdQtrXcur6y5K9qVCpYFytRDs2AUHCjPh6C2s1qIhQsROPDZV1qzvPKiXf+LshH9Q+4rL2Ff8Pd
	n2WaxDr9Th1UIaE+RLSgrEnl4qAYH6GgYcxnaA2Q4TxRBYrEORChs
X-Google-Smtp-Source: AGHT+IHlhNv7Z5xzZ6DJSTtASPwRXAylUTndraD1JrBqg9CJlkdqKHlOecnLAZW5KgBOFe966U7XBA==
X-Received: by 2002:a05:6830:6188:b0:73b:2d85:2ef0 with SMTP id 46e09a7af769-73e66624cf8mr5965270a34.25.1752769779399;
        Thu, 17 Jul 2025 09:29:39 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1064f46sm3912330a34.14.2025.07.17.09.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:29:39 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [ANNOUNCE] kernel-patch-validator - Tool to validate patches before submission
Date: Thu, 17 Jul 2025 12:29:36 -0400
Message-Id: <20250717162936.23035-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <ZppSfKGao4PQvRJd@kroah.com>
References: <ZppSfKGao4PQvRJd@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 17, 2025 at 08:15:00AM -0400, Greg KH wrote:
> Note, it is now 2025, so this check keeps failing :)

Haha, you caught me! The irony of a date validation tool having its own
date bug... I've already fixed it to properly check against the current
year instead of hardcoding 2025.

> Overall, I like the idea, the implementation needs a bit of work, see
> the few github issues I opened on it for details found in my testing.

Thank you so much for taking the time to test it and open those issues!
I really appreciate the detailed feedback. I've been working through them
this morning:

- Fixed the 2025 check (now validates against current date) 
- Fixed the `set -e` issue so it shows all errors instead of bailing out
- Updated stable email validation to accept both formats
- Removed all the emojis (they looked unprofessional anyway)

> Can you add some of these checks to checkpatch.pl itself?  That would be
> the best thing to do in the end.  Having to use different tools makes
> things harder to keep in sync and to remember to use at all.

You're absolutely right about this. Having separate tools is definitely
not ideal - I often forgot to run my own validator!

I'm thinking the best approach would be:

1. Port the most useful checks to checkpatch.pl (like the changelog 
   placement check that would have saved me from your bot's rejection!)
2. Keep the workflow helpers separate (find-bugs.sh, test-patch.sh) 
   since they do more than just validation

Would you prefer if I start with small individual patches to checkpatch.pl
for each check, or should I put together an RFC first to discuss which
checks would be most valuable to integrate?

I built this tool mainly to understand what I was doing wrong. Now that
I've learned from my mistakes (thanks to you and Dan's feedback), it
makes total sense to help others by putting these checks where everyone
will actually use them.

Thanks,
Ignacio
