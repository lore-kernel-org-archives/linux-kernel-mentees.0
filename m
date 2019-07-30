From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Tue, 30 Jul 2019 21:09:29 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 0/1] get_user_pages changes
Message-ID: <1564501170-6830-1-git-send-email-linux.bhar@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190730153929.o0o7SL36p0iLJ9_vL_exWUVgj_9pJHC2wQ6HM-WUQVg@z>

In this 4th version of the patch series, I have compressed the patches
of the v2 patch series into one patch. This was suggested by Christoph Hellwig.
The suggestion was to remove the pte_lookup functions and use the 
get_user_pages* functions directly instead of the pte_lookup functions.

There is nothing different in this series compared to the previous
series, It essentially compresses the 3 patches of the original series
into one patch.

Bharath Vedartham (1):
  sgi-gru: Remove *pte_lookup functions

 drivers/misc/sgi-gru/grufault.c | 112 +++++++++-------------------------------
 1 file changed, 24 insertions(+), 88 deletions(-)

-- 
2.7.4
