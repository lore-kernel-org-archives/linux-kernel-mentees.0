From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Mon, 19 Aug 2019 01:08:53 +0530
Subject: [Linux-kernel-mentees] [PATCH v6 0/2] get_user_pages changes
Message-ID: <1566157135-9423-1-git-send-email-linux.bhar@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190818193853._4wRSAVqeRs6ToWeRtyrQ3k5iDNtfkCZDJHhysWRChs@z>

This version only converts put_page to put_user_page and removes
an unecessary ifdef. 

It does not convert atomic_pte_lookup to __get_user_pages as
gru_vtop could run in an interrupt context in which we can't assume
current as __get_user_pages does.

Bharath Vedartham (2):
  sgi-gru: Convert put_page() to put_user_page*()
  sgi-gru: Remove uneccessary ifdef for CONFIG_HUGETLB_PAGE

 drivers/misc/sgi-gru/grufault.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.7.4
