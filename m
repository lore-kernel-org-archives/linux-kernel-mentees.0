From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Fri,  9 Aug 2019 00:25:54 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 0/1] get_user_pages changes
Message-ID: <1565290555-14126-1-git-send-email-linux.bhar@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190808185554.-y1OtjN9N3x4pA4hHMzhp1Y-meZSQMsrkTQrufwm4OI@z>

In this 4th version of the patch series, I have compressed the patches
of the v2 patch series into one patch. This was suggested by Christoph Hellwig.
The suggestion was to remove the pte_lookup functions and use the 
get_user_pages* functions directly instead of the pte_lookup functions.

There is nothing different in this series compared to the previous
series, It essentially compresses the 3 patches of the original series
into one patch.

This series survives a compile test.

Bharath Vedartham (1):
  sgi-gru: Remove *pte_lookup functions

 drivers/misc/sgi-gru/grufault.c | 112 +++++++++-------------------------------
 1 file changed, 24 insertions(+), 88 deletions(-)

-- 
2.7.4
