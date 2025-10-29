Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363172E1747
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Oct 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761732459; cv=none; b=G4EZtl7bJLQJa0Wbzwigl8v7piN1DAs2LpTVXdGbIoZgC39XJ1rUWshZ7+gvB0VZixqIJn759A2+T4ZlWA1TWFpJkWs2NhMiHwwytyQHhl/OJqM0SsPeT3krJs2IQc/gowAb9CpZLdtf0IblfQ9c8/JbIQG269ujbwZW9QSwyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761732459; c=relaxed/simple;
	bh=US3KADJxNAGjpbXSwqf+py4gYwCFfPb0CGQWdSTV7I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9EW6x+3x0nFQBW5o+rkA/KHxEG6V0/Ds0eLRlQvEM1YzpONJft73mjO2BKm47r0Uy03cWG/o2QdJTz7CLH2WAx71xoJz8CXw2FxJ4z1cbwYo0YH0VnFzQQETaGwb9VfqeTykaLWYd13IHY2y88lue1gFu5SRAY8oIjV0fSZUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 59TA6kLO038858;
	Wed, 29 Oct 2025 19:06:46 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.10] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 59TA6kIm038850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 29 Oct 2025 19:06:46 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d2b28f73-49c8-4e30-9913-01702da4dfe4@I-love.SAKURA.ne.jp>
Date: Wed, 29 Oct 2025 19:06:46 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hfs: Validate CNIDs in hfs_read_inode
To: George Anthony Vernon <contact@gvernon.com>
Cc: Viacheslav Dubeyko <slava@dubeyko.com>,
        Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
        "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
        "frank.li@vivo.com" <frank.li@vivo.com>,
        "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-kernel-mentees@lists.linux.dev"
 <linux-kernel-mentees@lists.linux.dev>,
        "syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com"
 <syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251003024544.477462-1-contact@gvernon.com>
 <405569eb2e0ec4ce2afa9c331eb791941d0cf726.camel@ibm.com>
 <aOB3fME3Q4GfXu0O@Bertha>
 <6ec98658418f12b85e5161d28a59c48a68388b76.camel@dubeyko.com>
 <559c331f-4838-49fb-95aa-2d1498c8a41e@I-love.SAKURA.ne.jp>
 <aQGIBSZkIWr4Ym7I@Bertha>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <aQGIBSZkIWr4Ym7I@Bertha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav104.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/10/29 12:20, George Anthony Vernon wrote:
> I think HFS_POR_CNID case should be disallowed. There is no real
> underlying file with that CNID. If we ever found a record with that CNID
> it would mean the filesystem image was broken, and if we ever try to
> write a record with that CNID, it means we screwed up.

Hmm, your interpretation does not match what Viacheslav Dubeyko interpreted

  hfs_read_inode() can be called for the root directory and parent of
  the root cases. So, HFS_POR_CNID and HFS_ROOT_CNID are legitimate values.

at https://lkml.kernel.org/r/9a18338da59460bd5c95605d8b10f895a0b7dbb8.camel@ibm.com .

But if HFS_POR_CNID is not allowed, you can inline is_valid_cnid() for HFS_CDR_DIR case
like https://lkml.kernel.org/r/23498435-ee11-4eb9-9be9-8460a6fa17f1@I-love.SAKURA.ne.jp .

> I agree your check is good to catch root inode's i_ino > 15 (is this
> reachable?) and I'd like to add it. Would you be happy if I make a
> 2-part patch series with your patch second, keeping your sign-off on it?

OK.

